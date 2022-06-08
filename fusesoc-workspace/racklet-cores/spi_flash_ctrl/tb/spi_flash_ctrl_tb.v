`timescale 1ns/1ns
`default_nettype none

module simple_wb_master (
    input  wire         i_test_stb,

    input  wire         wb_clk_i,
    input  wire         wb_rst_i,

    output reg          wb_cyc_o,
    output reg          wb_stb_o,
    output wire [31:0]  wb_adr_o,
    input  wire [31:0]  wb_dat_i,
    input  wire         wb_ack_i
);

    reg [9:0] cnt = 0;
    reg blasting_mode = 0;

    assign wb_adr_o = {22'b0, cnt};

    always @(posedge wb_clk_i) begin
        if (wb_rst_i) begin
            cnt <= 0;
            wb_cyc_o <= 0;
            wb_stb_o <= 0;
        end else if (i_test_stb) begin
            blasting_mode <= 1;
        end
    end

    always @(*) begin
        if (blasting_mode) begin
            wb_cyc_o = 1;
            wb_stb_o = 1;
        end
    end

    always @(posedge wb_clk_i) begin
        if (blasting_mode) begin
            if (wb_stb_o && wb_ack_i)
                cnt <= cnt + 1;
        end
    end

endmodule


module spi_flash_ctrl_tb;

    vlog_tb_utils vtu();

    reg clk = 1;
    always #1 clk=~clk;

    reg rst = 0;

    reg test_stb = 0;
    wire        wb_cyc_m2s;
    wire        wb_stb_m2s;
    wire        wb_we_m2s;
    wire [31:0] wb_adr_m2s;
    wire [31:0] wb_dat_m2s;
    wire        wb_ack_s2m;

    wire flash_cs;
    wire flash_clk;
    wire flash_mosi;
    wire flash_miso;
    wire flash_wp_n;
    wire flash_reset_n;

    reg flash_reset_reg = 1;
    assign flash_wp_n = 1;

    assign flash_reset_n = flash_reset_reg;

    spiflash spiflash_model (
        .csb            ( flash_cs      ),
        .clk            ( flash_clk     ),
        .io0            ( flash_mosi    ),
        .io1            ( flash_miso    ),
        .io2            ( flash_wp_n    ),
        .io3            ( flash_reset_n )
    );

    simple_wb_master wb_blaster (
        .i_test_stb     ( test_stb      ),
        .wb_clk_i       ( clk           ),
        .wb_rst_i       ( rst           ),
        .wb_cyc_o       ( wb_cyc_m2s    ),
        .wb_stb_o       ( wb_stb_m2s    ),
        .wb_adr_o       ( wb_adr_m2s    ),
        .wb_dat_i       ( wb_dat_m2s    ),
        .wb_ack_i       ( wb_ack_s2m    )
    );

    wb_spi_flash_ctrl dut(
        .wb_clk_i       ( clk           ),
        .wb_rst_i       ( rst           ),

        .wb_cyc_i       ( wb_cyc_m2s    ),
        .wb_stb_i       ( wb_stb_m2s    ),
        .wb_we_i        ( 1'b0          ),
        .wb_adr_i       ( wb_adr_m2s    ),
        .wb_dat_i       ( wb_dat_m2s    ),
        .wb_ack_o       ( wb_ack_s2m    ), 

        .o_spi_cs_n     ( flash_cs      ),
        .o_spi_clk      ( flash_clk     ),
        .o_spi_mosi     ( flash_mosi    ),
        .i_spi_miso     ( flash_miso    )
    );



    initial begin
        $display("Running testbench: spi_flash_ctrl_tb");
        #100000;
        $finish;
    end

    integer i;
    initial begin

        // reset
        #2 rst <= 1;
        #4 rst <= 0;

        #2 flash_reset_reg <= 0;
        #4 flash_reset_reg <= 1;

        // wishbone reads
        #2 test_stb <= 1;
        #2 test_stb <= 0;

    end

endmodule
