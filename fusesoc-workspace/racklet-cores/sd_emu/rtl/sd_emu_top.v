`default_nettype none

// TODO:
//   * fix design in simulation

module sd_emu_top #(
    parameter [127:0] TARGET = "NONE",
    parameter [127:0] PLL = "NONE"
) (
    input               CLK,            // 16MHz clock
    output              LED,            // User/boot LED next to power LED
    output              USBPU,          // USB pull-up resistor
    output              PIN_24,         // probe PLL output
    output              PIN_23,         // probe PLL output
    output              PIN_22,         // probe PLL output
    input   wire        i_sd_clk,       // PIN 16 (Global Buffer GBIN2)
    inout   wire        io_sd_cmd,      // PIN 17
    inout   wire [3:0]  io_sd_dat,      // PINs 18, 19, 20, 21 -- 0, 1, 2, 3

    // SPI flash
    output wire o_spi_cs_n,             // SPI flash chip select (active low)   pin 15
    output wire o_spi_clk,              // SPI flash serial clock               pin 14
    output wire o_spi_mosi,             // SPI flash master to slave data       pin 13
    input  wire i_spi_miso,             // SPI flash slave to master data       pin 12
  
    output  wire PIN_7,                 // PIN 7       
    output  wire PIN_8,                 // PIN 8       
    output  wire PIN_9                  // PIN 9       
);

// drive USB pull-up resistor to '0' to disable USB
assign USBPU = 0;

// Route SD clock input through a global buffer
wire i_sd_clk_buf;
generate
    if (TARGET == "SYNTH_ICE40")
    begin
        SB_GB_IO sd_clock_buffer(
            .PACKAGE_PIN (i_sd_clk),
            .GLOBAL_BUFFER_OUTPUT (i_sd_clk_buf)
        );
    end
    else if (TARGET == "SYNTH_ECP5")
    begin
        assign i_sd_clk_buf = i_sd_clk; // TODO: generate 50 MHz from 25 MHz
    end
    else if (TARGET=="SIM")
    begin
        assign i_sd_clk_buf = i_sd_clk;
    end
endgenerate

// Instantiate bidirectional buffers
wire sd_cmd_i, sd_cmd_o, sd_cmd_t;
assign io_sd_cmd = sd_cmd_t ? 1'bZ : sd_cmd_o;
assign sd_cmd_i = io_sd_cmd;

wire [3:0] sd_dat_i, sd_dat_o, sd_dat_t;
// assign io_sd_dat[0] = sd_dat_t[0] ? 1'bZ : sd_dat_o[0];
// assign sd_dat_i[0] = io_sd_dat[0];
// assign io_sd_dat[1] = sd_dat_t[1] ? 1'bZ : sd_dat_o[1];
// assign sd_dat_i[1] = io_sd_dat[1];
// assign io_sd_dat[2] = sd_dat_t[2] ? 1'bZ : sd_dat_o[2];
// assign sd_dat_i[2] = io_sd_dat[2];
// assign io_sd_dat[3] = sd_dat_t[3] ? 1'bZ : sd_dat_o[3];
// assign sd_dat_i[3] = io_sd_dat[3];
assign io_sd_dat = sd_dat_t ? 4'bZ : sd_dat_o;

// SB_IO #(
//     .PIN_TYPE(6'b101001)
// ) sd_cmd_buffer (
//     .PACKAGE_PIN(io_sd_cmd),
//     .OUTPUT_ENABLE(sd_cmd_t),
//     .D_OUT_0(sd_cmd_o),
//     .D_IN_0(sd_cmd_i)
// );
// wire [3:0] sd_dat_i, sd_dat_o, sd_dat_t;
// genvar i;
// generate for(i = 0; i < 4; i = i + 1) begin : sd_dat_IOBUF
//     SB_IO #(
//         .PIN_TYPE(6'b101001)
//     ) sd_cmd_buffer (
//         .PACKAGE_PIN(io_sd_dat[i]),
//         .OUTPUT_ENABLE(sd_dat_t[i]),
//         .D_OUT_0(sd_dat_o[i]),
//         .D_IN_0(sd_dat_i[i])
//     );
// end endgenerate

wire pll_clk_50;
wire pll_rst;

generate
    // Generate 200 MHz internal clock from PLL for synth TARGETget
    if ((PLL == "ICE40_CORE") || (PLL == "ICE40_PAD")) begin
        // internal 200MHz clock
        ice40_pll #(
            .PLL (PLL)
        ) pll (
            .i_clk(CLK),
            .o_clk(pll_clk_50),
            .o_rst(pll_rst)
        );
    // Pass through clock input for simulation
    // TODO: This probably throws off the simulation timescale since the CLK
    // input signal is a 16 MHz clock signal, and it's being interpreted as
    // the 200 MHz internal clock signal
    end else begin
        assign pll_clk_50 = CLK;
        reg [4:0] rst_reg = 5'b11111;
        always @(posedge pll_clk_50)
            rst_reg <= {1'b0, rst_reg[4:1]};
        assign pll_rst = rst_reg[0];
    end
endgenerate

// Derived clocks
// wire clk_200, clk_100, clk_50;
// assign clk_200 = pll_clk_50;
// clk_div_2 cdiv_100(
//     .i_clk(clk_200),
//     .o_clk(clk_100)
// );
// clk_div_2 cdiv_50(
//     .i_clk(clk_100),
//     .o_clk(clk_50)
// );
// wire clk_100_buf, clk_50_buf;
// SB_GB clk_100_buffer(
//     .USER_SIGNAL_TO_GLOBAL_BUFFER(clk_100),
//     .GLOBAL_BUFFER_OUTPUT(clk_100_buf)
// );
// wire clk_50_buf;
// SB_GB clk_50_buffer(
//     .USER_SIGNAL_TO_GLOBAL_BUFFER(pll_clk_50),
//     .GLOBAL_BUFFER_OUTPUT(clk_50_buf)
// );

// assign PIN_24 = ;            // probe clock signal
assign PIN_23 = pll_rst;        // probe reset signal
// assign PIN_22 = clk_50_buf;     // probe clock signal
// assign PIN_9 =  ;


wire        wb_clk;
wire [31:0] wb_m2s_sdhc_adr;
wire [31:0] wb_m2s_sdhc_dat;
wire  [3:0] wb_m2s_sdhc_sel;
wire        wb_m2s_sdhc_we;
wire        wb_m2s_sdhc_cyc;
wire        wb_m2s_sdhc_stb;
// wire  [2:0] wb_m2s_sdhc_cti;
// wire  [1:0] wb_m2s_sdhc_bte;
wire [31:0] wb_s2m_sdhc_dat;
wire        wb_s2m_sdhc_ack;

// wb_a wb_slave(
//     .wb_clk_i(wb_clk),
//     .wb_rst_i(pll_rst),
// 
//     .wb_adr_i(wb_m2s_sdhc_adr),
//     .wb_dat_i(wb_m2s_sdhc_dat),
//     .wb_sel_i(wb_m2s_sdhc_sel),
//     .wb_cyc_i(wb_m2s_sdhc_cyc),
//     .wb_stb_i(wb_m2s_sdhc_stb),
//     .wb_we_i(wb_m2s_sdhc_we),
//     // .wb_cti_i(wb_m2s_shdc_cti),
//     // .wb_bte_i(wb_m2s_sdhc_bti),
//     .wb_dat_o(wb_s2m_sdhc_dat),
//     .wb_ack_o(wb_s2m_sdhc_ack)
//     // .wb_err_o(wb_s2m_sdhc_err),
//     // .wb_rty_o(wb_s2m_sdhc_rty)
// );

wb_spi_flash_ctrl wb_spi_flash (
    // Wishbone Interface
    .wb_clk_i(wb_clk),
    .wb_rst_i(pll_rst),

    .wb_cyc_i(wb_m2s_sdhc_cyc),
    .wb_stb_i(wb_m2s_sdhc_stb),
    .wb_we_i(wb_m2s_sdhc_we),
    .wb_adr_i(wb_m2s_sdhc_adr),
    .wb_dat_i(wb_m2s_sdhc_dat),
    .wb_dat_o(wb_s2m_sdhc_dat),
    .wb_ack_o(wb_s2m_sdhc_ack),
    // .wb_sel_i(wb_m2s_sdhc_sel),
    // .wb_cti_i(wb_m2s_shdc_cti),
    // .wb_bte_i(wb_m2s_sdhc_bti),
    // .wb_err_o(wb_s2m_sdhc_err),
    // .wb_rty_o(wb_s2m_sdhc_rty)

    // Connections to SPI flash
    .o_spi_cs_n ( o_spi_cs_n ),
    .o_spi_clk  ( o_spi_clk  ),
    .o_spi_mosi ( o_spi_mosi ),
    .i_spi_miso ( i_spi_miso )
);

// output wire        wbm_clk_o,
// output wire [31:0] wbm_adr_o,
// input  wire [31:0] wbm_dat_i,
// output wire [31:0] wbm_dat_o,
// output wire [3:0]  wbm_sel_o,
// output wire        wbm_cyc_o,
// output wire        wbm_stb_o,
// output wire        wbm_we_o,
// input  wire        wbm_ack_i,
// output wire [2:0]  wbm_cti_o,
// output wire [1:0]  wbm_bte_o,

sd_top sd_top (
    .clk_50        ( pll_clk_50 ),
    .reset_n       ( ~pll_rst ),

    .sd_clk        ( i_sd_clk_buf ),
    .sd_cmd_i      ( sd_cmd_i ),
    .sd_cmd_o      ( sd_cmd_o ),
    .sd_cmd_t      ( sd_cmd_t ),
    .sd_dat_i      ( sd_dat_i ),
    .sd_dat_o      ( sd_dat_o ),
    .sd_dat_t      ( sd_dat_t ),

    .wbm_clk_o     ( wb_clk ),
    .wbm_adr_o     ( wb_m2s_sdhc_adr ),
    .wbm_dat_o     ( wb_m2s_sdhc_dat ),
    .wbm_sel_o     ( wb_m2s_sdhc_sel ),
    .wbm_cyc_o     ( wb_m2s_sdhc_cyc ),
    .wbm_stb_o     ( wb_m2s_sdhc_stb ),
    .wbm_we_o      ( wb_m2s_sdhc_we ),
    // .wbm_cti_o     ( wb_m2s_sdhc_cti ),
    // .wbm_bte_o     ( wb_m2s_sdhc_bte ),
    .wbm_dat_i     ( wb_s2m_sdhc_dat ),
    .wbm_ack_i     ( wb_s2m_sdhc_ack ),

    .opt_enable_hs ( 1'b0 )
);

assign PIN_7 = sd_cmd_t;
assign PIN_8 = sd_cmd_o;

endmodule
