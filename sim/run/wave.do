onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/clk128
add wave -noupdate /testbench/clk125
add wave -noupdate /testbench/miiTxClk
add wave -noupdate /testbench/miiRxClk
add wave -noupdate /testbench/reset
add wave -noupdate /testbench/Rx_clk
add wave -noupdate /testbench/Tx_clk
add wave -noupdate /testbench/hm_Rx_er
add wave -noupdate /testbench/hm_Rx_dv
add wave -noupdate /testbench/hm_Rxd
add wave -noupdate /testbench/hm_Tx_en
add wave -noupdate /testbench/hm_Txd
add wave -noupdate /testbench/hm_Rx_dv2
add wave -noupdate /testbench/hm_Rxd2
add wave -noupdate /testbench/hm_Tx_en2
add wave -noupdate /testbench/hm_Txd2
add wave -noupdate /testbench/hm_Rx_dv3
add wave -noupdate /testbench/hm_Rxd3
add wave -noupdate /testbench/hm_Tx_en3
add wave -noupdate /testbench/hm_Txd3
add wave -noupdate /testbench/mode
add wave -noupdate /testbench/testcase_name
add wave -noupdate /testbench/hm_Crs
add wave -noupdate /testbench/hm_Col
add wave -noupdate /testbench/mac_speed
add wave -noupdate /testbench/dpram21_wren
add wave -noupdate /testbench/dpram21_rden
add wave -noupdate /testbench/dpram21_addr
add wave -noupdate /testbench/dpram21_data_out
add wave -noupdate /testbench/mac_ca
add wave -noupdate /testbench/mac_cd_in
add wave -noupdate /testbench/mac_csb
add wave -noupdate /testbench/mac_wrb
add wave -noupdate /testbench/rdy
add wave -noupdate /testbench/mode_switch

add wave -noupdate /testbench/ff_rx_data_mac1
add wave -noupdate /testbench/ff_rx_mod_mac1
add wave -noupdate /testbench/rx_err_mac1
add wave -noupdate /testbench/mac_cd_out1
add wave -noupdate /testbench/ff_rx_sop_mac1
add wave -noupdate /testbench/ff_rx_eop_mac1
add wave -noupdate /testbench/ff_rx_dsav_mac1
add wave -noupdate /testbench/ff_rx_dval_mac1
add wave -noupdate /testbench/ff_tx_err1
add wave -noupdate /testbench/tx_ff_uflow1
add wave -noupdate /testbench/ff_tx_rdy1
add wave -noupdate /testbench/ff_tx_septy1

add wave -noupdate /testbench/ff_rx_data_mac2
add wave -noupdate /testbench/ff_rx_mod_mac2
add wave -noupdate /testbench/rx_err_mac2
add wave -noupdate /testbench/mac_cd_out2
add wave -noupdate /testbench/ff_rx_sop_mac2
add wave -noupdate /testbench/ff_rx_eop_mac2
add wave -noupdate /testbench/ff_rx_dsav_mac2
add wave -noupdate /testbench/ff_rx_dval_mac2
add wave -noupdate /testbench/ff_tx_err2
add wave -noupdate /testbench/tx_ff_uflow2
add wave -noupdate /testbench/ff_tx_rdy2
add wave -noupdate /testbench/ff_tx_septy2

add wave -noupdate /testbench/ff_rx_data_mac3
add wave -noupdate /testbench/ff_rx_mod_mac3
add wave -noupdate /testbench/rx_err_mac3
add wave -noupdate /testbench/mac_cd_out3
add wave -noupdate /testbench/ff_rx_sop_mac3
add wave -noupdate /testbench/ff_rx_eop_mac3
add wave -noupdate /testbench/ff_rx_dsav_mac3
add wave -noupdate /testbench/ff_rx_dval_mac3
add wave -noupdate /testbench/ff_tx_err3
add wave -noupdate /testbench/tx_ff_uflow3
add wave -noupdate /testbench/ff_tx_rdy3
add wave -noupdate /testbench/ff_tx_septy3

add wave -noupdate /testbench/i
add wave -noupdate /testbench/len
add wave -noupdate /testbench/data_cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2835153008 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 241
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {7964439 ns}
