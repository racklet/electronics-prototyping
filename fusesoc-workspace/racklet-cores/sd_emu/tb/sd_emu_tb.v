`timescale 1ns/10ps

module sd_emu_tb;

vlog_tb_utils vtu();

// 50 MHz internal PLL
reg clk = 0;
always #10 clk=~clk;

reg sd_clk = 0;

tri1 sd_cmd_io;
reg sd_cmd_o, sd_cmd_oe;
wire sd_cmd_i;
assign sd_cmd_io = sd_cmd_oe ? sd_cmd_o : 1'bZ;
assign sd_cmd_i = sd_cmd_io;

// FIXME: tri1 pulls the whole bus to value 0b0001 instead of pulling to 0b1111
wire [3:0] sd_data_io;
reg [3:0] sd_data_o, sd_data_oe;
wire [3:0] sd_data_i;
assign sd_data_io = sd_data_oe ? sd_data_o : 4'bZZZZ;
assign sd_data_i = sd_data_io;

wire spi_cs, spi_clk, spi_mosi, spi_miso;

spiflash flash_sim_model (
    .clk    (spi_clk),
	.csb    (spi_cs),
	.io0    (spi_mosi), // MOSI
	.io1    (spi_miso) // MISO
);

sd_emu_top #(
    .TARGET("SIM")
) dut (
    // main clock input
    .CLK(clk),

    // SD card interface
    .io_sd_cmd  ( sd_cmd_io  ),
    .i_sd_clk   ( sd_clk     ),
    .io_sd_dat  ( sd_data_io ),

    // SPI flash interface
    .o_spi_cs_n ( spi_cs     ),     // SPI flash chip select (active low)
    .o_spi_clk  ( spi_clk    ),     // SPI flash serial clock
    .o_spi_mosi ( spi_mosi   ),     // SPI flash master to slave data
    .i_spi_miso ( spi_miso   )      // SPI flash slave to master data
);

localparam [31:0] SD_DELAY_1 = 1335;    // 375 kHz init clock delay
localparam [31:0] SD_DELAY_2 = 20;      // 25 MHz transfer mode clock delay

initial begin

    // before sd host starts init sequence
    sd_clk = 0;
    sd_cmd_o = 0;
    sd_cmd_oe = 1;
    sd_data_oe = 0;
    #10000;

    // power ramp up period
    sd_clk = 1;
    sd_cmd_o = 1;
    sd_cmd_oe = 1;
    sd_data_o = 1;
    #10000;

    // clock sd_clk to let device internal logic initialize
    sd_clk = 1;
    for (integer i = 0; i < 1000; i = i + 1) begin
        sd_clk = 0; #SD_DELAY_1;
        sd_clk = 1; #SD_DELAY_1;
    end

    /************************* Initialization Sequence ****************************/
    // Hold CS (dat[3]) high to enter SD mode
    sd_data_o = 4'b1111; sd_data_oe = 4'b1111;
    sd_command( 6'd0,  32'h00000000, 7'h4a, SD_DELAY_1 );    // CMD0   GO_IDLE_STATE
    sd_data_o = 4'b0000; sd_data_oe = 4'b0000;
    cycle_sd_clk(8, SD_DELAY_1);

    sd_command( 6'd8,  32'h000001aa, 7'h43, SD_DELAY_1 );    // CMD8   SEND_IF_COND
    cycle_sd_clk(64, SD_DELAY_1);

    sd_command( 6'd55, 32'h00000000, 7'h32, SD_DELAY_1 );    // CMD55  APP_CMD
    cycle_sd_clk(64, SD_DELAY_1);
    sd_command( 6'd41, 32'h40ff8000, 7'h0b, SD_DELAY_1 );    // ACMD41 SD_SEND_OP_COND
    cycle_sd_clk(64, SD_DELAY_1);

    sd_command( 6'd2,  32'h00000000, 7'h26, SD_DELAY_1 );    // CMD2 ALL_SEND_CID
    cycle_sd_clk(150, SD_DELAY_1);

    sd_command( 6'd3,  32'h00000000, 7'h10, SD_DELAY_1 );    // CMD3 SEND_RELATIVE_ADDR
    cycle_sd_clk(64, SD_DELAY_1);

    sd_command( 6'd9,  32'h13370000, 7'h48, SD_DELAY_1 );    // CMD9 SEND_CSD
    cycle_sd_clk(150, SD_DELAY_1);

    sd_command( 6'd7,  32'h13370000, 7'h5e, SD_DELAY_1 );    // CMD7 SELECT/DESELECT_CARD
    cycle_sd_clk(64, SD_DELAY_1);

    sd_command( 6'd55, 32'h13370000, 7'h2d, SD_DELAY_1 );    // CMD55  APP_CMD
    cycle_sd_clk(64, SD_DELAY_1);
    sd_command( 6'd42, 32'h00000000, 7'h28, SD_DELAY_1 );    // ACMD42 SET_CLR_CARD_DETECT
    cycle_sd_clk(64, SD_DELAY_1);


    /***************************** Transfer Mode ********************************/
    cycle_sd_clk(1000, SD_DELAY_2);
    
    sd_command( 6'd55, 32'h13370000, 7'h2d, SD_DELAY_2 );    // CMD55  APP_CMD
    cycle_sd_clk(64, SD_DELAY_2);
    sd_command( 6'd6, 32'h00000002, 7'h65, SD_DELAY_2 );     // ACMD6 SET_BUS_WIDTH
    cycle_sd_clk(64, SD_DELAY_2);

    //sd_command( 6'd17, 32'h00000000, 7'h2a, SD_DELAY_2 );    // CMD17  READ_SINGLE_BLOCK
    //cycle_sd_clk(100000, SD_DELAY_2);

    // sd_command( 6'd18, 32'h00000000, 7'h70, SD_DELAY_2 );    // CMD17  READ_MULTIPLE_BLOCK
    // cycle_sd_clk(100000, SD_DELAY_2);

    // sd_command( 6'd12, 32'h00000000, 7'h30, SD_DELAY_2 );    // CMD12  STOP_TRANSMISSION
    // cycle_sd_clk(100000, SD_DELAY_2);

    // sd_command( 6'd4, 32'h00000001, 7'h2b, SD_DELAY_2 );     // CMD4  SET_DSR
    // cycle_sd_clk(100000, SD_DELAY_2);

    // sd_command( 6'd17, 32'h00000000, 7'h2a, SD_DELAY_2 );    // CMD17  READ_SINGLE_BLOCK
    // cycle_sd_clk(100000, SD_DELAY_2);

    // start another block read before first finishes
    sd_command( 6'd18, 32'h00000000, 7'h70, SD_DELAY_2 );    // CMD18  READ_MULTIPLE_BLOCK
    cycle_sd_clk(92700, SD_DELAY_2);

    sd_command( 6'd12, 32'h00000000, 7'h30, SD_DELAY_2 );    // CMD12 STOP_TRANSMISSION

    cycle_sd_clk(1000, SD_DELAY_2);
    sd_command( 6'd18, 32'h00000001, 7'h79, SD_DELAY_2 );    // CMD18  READ_MULTIPLE_BLOCK

    cycle_sd_clk(100000, SD_DELAY_2);



/** reset during read */
//    /************************* Initialization Sequence ****************************/
//    // Hold CS (dat[3]) high to enter SD mode
//    sd_data_o = 4'b1111; sd_data_oe = 4'b1111;
//    sd_command( 6'd0,  32'h00000000, 7'h4a, SD_DELAY_1 );    // CMD0   GO_IDLE_STATE
//    sd_data_o = 4'b0000; sd_data_oe = 4'b0000;
//    cycle_sd_clk(8, SD_DELAY_1);
//
//    sd_command( 6'd8,  32'h000001aa, 7'h43, SD_DELAY_1 );    // CMD8   SEND_IF_COND
//    cycle_sd_clk(64, SD_DELAY_1);
//
//    sd_command( 6'd55, 32'h00000000, 7'h32, SD_DELAY_1 );    // CMD55  APP_CMD
//    cycle_sd_clk(64, SD_DELAY_1);
//    sd_command( 6'd41, 32'h40ff8000, 7'h0b, SD_DELAY_1 );    // ACMD41 SD_SEND_OP_COND
//    cycle_sd_clk(64, SD_DELAY_1);
//
//    sd_command( 6'd2,  32'h00000000, 7'h26, SD_DELAY_1 );    // CMD2 ALL_SEND_CID
//    cycle_sd_clk(150, SD_DELAY_1);
//
//    sd_command( 6'd3,  32'h00000000, 7'h10, SD_DELAY_1 );    // CMD3 SEND_RELATIVE_ADDR
//    cycle_sd_clk(64, SD_DELAY_1);
//
//    sd_command( 6'd9,  32'h13370000, 7'h48, SD_DELAY_1 );    // CMD9 SEND_CSD
//    cycle_sd_clk(150, SD_DELAY_1);
//
//    sd_command( 6'd7,  32'h13370000, 7'h5e, SD_DELAY_1 );    // CMD7 SELECT/DESELECT_CARD
//    cycle_sd_clk(64, SD_DELAY_1);
//
//    sd_command( 6'd55, 32'h13370000, 7'h2d, SD_DELAY_1 );    // CMD55  APP_CMD
//    cycle_sd_clk(64, SD_DELAY_1);
//    sd_command( 6'd42, 32'h00000000, 7'h28, SD_DELAY_1 );    // ACMD42 SET_CLR_CARD_DETECT
//    cycle_sd_clk(64, SD_DELAY_1);
//
//
//    /***************************** Transfer Mode ********************************/
//    cycle_sd_clk(1000, SD_DELAY_2);
//    
//    sd_command( 6'd55, 32'h13370000, 7'h2d, SD_DELAY_2 );    // CMD55  APP_CMD
//    cycle_sd_clk(64, SD_DELAY_2);
//    sd_command( 6'd6, 32'h00000002, 7'h65, SD_DELAY_2 );     // ACMD6 SET_BUS_WIDTH
//    cycle_sd_clk(64, SD_DELAY_2);
//
//    //sd_command( 6'd17, 32'h00000000, 7'h2a, SD_DELAY_2 );    // CMD17  READ_SINGLE_BLOCK
//    //cycle_sd_clk(100000, SD_DELAY_2);
//
//    // sd_command( 6'd18, 32'h00000000, 7'h70, SD_DELAY_2 );    // CMD17  READ_MULTIPLE_BLOCK
//    // cycle_sd_clk(100000, SD_DELAY_2);
//
//    // sd_command( 6'd12, 32'h00000000, 7'h30, SD_DELAY_2 );    // CMD12  STOP_TRANSMISSION
//    // cycle_sd_clk(100000, SD_DELAY_2);
//
//    // sd_command( 6'd4, 32'h00000001, 7'h2b, SD_DELAY_2 );     // CMD4  SET_DSR
//    // cycle_sd_clk(100000, SD_DELAY_2);
//
//    sd_command( 6'd17, 32'h00000000, 7'h2a, SD_DELAY_2 );    // CMD17  READ_SINGLE_BLOCK
//    cycle_sd_clk(100000, SD_DELAY_2);
/** end reset during read **/

    // sd_command( 6'd6, 32'h00fffff1, 7'hf, SD_DELAY_2 );     // CMD17  READ_SINGLE_BLOCK
    // cycle_sd_clk(100000, SD_DELAY_2);

    // another one (does this trigger SPI flash read?)
    // sd_command( 6'd17, 32'h00000000, 7'h2a, SD_DELAY_2 );    // CMD17  READ_SINGLE_BLOCK
    // cycle_sd_clk(100000, SD_DELAY_2);

    // another one!
    // TODO: calculate proper CRC value
    // sd_command( 6'd17, 32'h00000200, 7'h2a, SD_DELAY_2 );    // CMD17  READ_SINGLE_BLOCK
    // cycle_sd_clk(1000000, SD_DELAY_2);

    $finish;
end

task sd_command;
    input [5:0] cmd_index;
    input [31:0] argument;
    input [6:0] crc7;
    input [31:0] delay;
    begin
        sd_cmd_oe = 1;

        // start bit
        sd_cmd_o = 0;
        cycle_sd_clk(1, delay);

        // host to device
        sd_cmd_o = 1;
        cycle_sd_clk(1, delay);


        // command index
        for (integer i = 0; i < 6; i = i + 1) begin
            sd_cmd_o = cmd_index[5-i];
            cycle_sd_clk(1, delay);
        end

        // argument
        for (integer i = 0; i < 32; i = i + 1) begin
            sd_cmd_o = argument[31-i];
            cycle_sd_clk(1, delay);

        end

        // crc
        for (integer i = 0; i < 7; i = i + 1) begin
            sd_cmd_o = crc7[6-i];
            cycle_sd_clk(1, delay);

        end

        // end bit
        sd_cmd_o = 1;
        cycle_sd_clk(1, delay);
        sd_cmd_oe = 0;
    end
endtask

task cycle_sd_clk;
    input [31:0] cycles;
    input [31:0] delay;

    for (integer i = 0; i < cycles; i = i + 1) begin
        sd_clk = 0; #delay;
        sd_clk = 1; #delay;
    end
endtask

endmodule
