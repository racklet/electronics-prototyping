puts "Hello world!"

gtkwave::addCommentTracesFromList [list "Top-level Signals"]
set top_signals [list sd_emu_tb.clk \
                      sd_emu_tb.sd_clk \
                      sd_emu_tb.sd_cmd_io \
                      sd_emu_tb.sd_data_io \
                ]
gtkwave::addSignalsFromList $top_signals
gtkwave::/Edit/Insert_Blank


gtkwave::addCommentTracesFromList [list "Wishbone Master"]
set wbm_signals [list sd_emu_tb.dut.sd_top.wbm_clk_o \
                      sd_emu_tb.dut.sd_top.wbm_adr_o \
                      sd_emu_tb.dut.sd_top.wbm_dat_i \
                      sd_emu_tb.dut.sd_top.wbm_cyc_o \
                      sd_emu_tb.dut.sd_top.wbm_stb_o \
                ]
gtkwave::addSignalsFromList $wbm_signals
gtkwave::/Edit/Insert_Blank

gtkwave::/Time/Zoom/Zoom_Full
