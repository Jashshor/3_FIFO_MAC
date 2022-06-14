`timescale 1ns/1ps

module testbench;

wire clk128;
wire clk125;
wire miiTxClk;
wire miiRxClk;
wire reset;

clockGenerator U_clockGenerator(
  .clk128(clk128),
  .clk125(clk125),
  .miiTxClk(miiTxClk),
  .miiRxClk(miiRxClk),
  .reset(reset));

wire Rx_clk;
wire Tx_clk;
wire hm_Rx_er;
wire hm_Rx_dv;
wire hm_Tx_en;
wire [7:0] hm_Rxd;
wire [7:0] hm_Txd;
wire [7:0] hm_Rxd2;
wire [7:0] hm_Txd2;
wire [7:0] hm_Rxd3;
wire [7:0] hm_Txd3;
wire hm_Rx_dv2;
wire hm_Tx_en2;
wire hm_Rx_dv3;
wire hm_Tx_en3;

reg mode;
reg [200:1]   testcase_name;

ephy U_ephy_hm(
  .GTx_clk(clk125),
  .Rx_clk(Rx_clk),
  .Tx_clk(Tx_clk),
  .Rx_er(hm_Rx_er),
  .Rx_dv(hm_Rx_dv),
  .Rxd(hm_Rxd),
  .Crs(hm_Crs),
  .Col(hm_Col),
  .mode(mode));
  
wire [2:0] mac_speed;

wire   dpram21_wren;
wire   dpram21_rden;

wire [7:0] dpram21_addr;
wire [15:0] dpram21_data_out;

reg [7:0] mac_ca ;  // = dpram21_addr[7:0];
reg [15:0] mac_cd_in ;   //= dpram21_data_out[15:0];
//assign dpram21_data_in = {16'd0, mac_cd_out};
reg mac_csb ;  //= ~(dpram21_rden | dpram21_wren);
reg mac_wrb ;  //= ~dpram21_wren; 
reg rdy;
reg mode_switch;

task CHOOSE_MODE;
begin
	if(mode==0)//100M
		begin
			mac_ca = 8'b0;
			mac_cd_in = 16'b0;
			mac_csb = 1'b1;
			mac_wrb = 1'b1;
		end
	else//100M
		begin
			mac_ca = 8'b0;
			mac_cd_in = 16'b0;
			mac_csb = 1'b1;
			mac_wrb = 1'b1;
		end
//mac_ca = 8'b0;
//mac_cd_in = 16'b0;
//rdy=1'b0;
//mac_csb = 1'b1;
//mac_wrb = 1'b1;
//mode=1'b0;
//mode_switch=0;
//
//wait(mode_switch==1);
//mac_ca = 8'h44;
//mac_cd_in = 16'h4;
//rdy=1'b1;
//mac_csb = 1'b0;
//mac_wrb = 1'b0;	
//repeat(10)
//    @(posedge clk128);
//mac_ca = 8'h0;
//mac_cd_in = 16'h4;
//rdy=1'b1;
//mac_csb = 1'b1;
//mac_wrb = 1'b1;		
//
//#10000
//mode=1'b0;

end
endtask

wire [31:0] ff_rx_data_mac1;
wire [1:0]   ff_rx_mod_mac1;

wire [5:0] rx_err_mac1;
wire [15:0]   mac_cd_out1;

wire [31:0] ff_rx_data_mac2;
wire [1:0]   ff_rx_mod_mac2;

wire [5:0] rx_err_mac2;
wire [15:0]   mac_cd_out2;

wire [31:0] ff_rx_data_mac3;
wire [1:0]   ff_rx_mod_mac3;

wire [5:0] rx_err_mac3;
wire [15:0]   mac_cd_out3;
  
MAC_top MAC_top_inst1_2
(
  .Reset(reset),
  .Clk_125M(clk125),
  .Clk_user(clk128),
  .Clk_reg(clk128),
  .Speed(mac_speed),
  .ff_rx_rdy(rdy),
  .ff_rx_data(ff_rx_data_mac1),
  .ff_rx_mod(ff_rx_mod_mac1),
  .ff_rx_sop(ff_rx_sop_mac1),
  .ff_rx_eop(ff_rx_eop_mac1),
  .ff_rx_dsav(ff_rx_dsav_mac1),	//Output not to be uesd directly
  .ff_rx_dval(ff_rx_dval_mac1),
  .rx_err(rx_err_mac1),
  .ff_tx_data(ff_rx_data_mac3),
  .ff_tx_mod(ff_rx_mod_mac3),
  .ff_tx_sop(ff_rx_sop_mac3),
  .ff_tx_eop(ff_rx_eop_mac3),
  .ff_tx_wren(ff_rx_dval_mac3),
  .ff_tx_err(ff_tx_err3),
  .tx_ff_uflow(tx_ff_uflow1),	//Output1 for TX ports
  .ff_tx_rdy(ff_tx_rdy1),
  .ff_tx_septy(ff_tx_septy1),  	//Output2 for TX ports
  .Rx_clk(Rx_clk),
  .Tx_clk(Tx_clk),
  .Tx_er(),
  .Tx_en(hm_Tx_en),
  .Txd(hm_Txd),		//Blank when its data isn't needed 
  .Rx_er(hm_Rx_er),
  .Rx_dv(hm_Rx_dv),
  .Rxd(hm_Rxd),		//Blank when its data isn't needed
  .Crs(1'b0),
  .Col(1'b0),
  .CSB(mac_csb),
  .WRB(mac_wrb),
  .CD_in(mac_cd_in),
  .CD_out(mac_cd_out),
  .CA(mac_ca));
  
MAC_top MAC_top_inst2_3
(
  .Reset(reset),
  .Clk_125M(clk125),
  .Clk_user(clk128),
  .Clk_reg(clk128),
  .Speed(mac_speed),
  .ff_rx_rdy(),
  .ff_rx_data(),
  .ff_rx_mod(),
  .ff_rx_sop(),
  .ff_rx_eop(),
  .ff_rx_dsav(),	//Output not to be uesd directly
  .ff_rx_dval(),
  .rx_err(),
  .ff_tx_data(ff_rx_data_mac1),
  .ff_tx_mod(ff_rx_mod_mac1),
  .ff_tx_sop(ff_rx_sop_mac1),
  .ff_tx_eop(ff_rx_eop_mac1),
  .ff_tx_wren(ff_rx_dval_mac1),
  .ff_tx_err(ff_tx_err1),
  .tx_ff_uflow(tx_ff_uflow2),	//Output1 for TX ports
  .ff_tx_rdy(ff_tx_rdy2),
  .ff_tx_septy(ff_tx_septy2),  	//Output2 for TX ports
  .Rx_clk(),
  .Tx_clk(Tx_clk),
  .Tx_er(Tx_er2),
  .Tx_en(hm_Tx_en2),		//TO Activate MAC3
  .Txd(hm_Txd2),		
  .Rx_er(),
  .Rx_dv(),
  .Rxd(),		//Blank when its data isn't needed
  .Crs(1'b0),
  .Col(1'b0),
  .CSB(mac_csb),
  .WRB(mac_wrb),
  .CD_in(mac_cd_in),
  .CD_out(mac_cd_out),
  .CA(mac_ca));
  

MAC_top MAC_top_inst3_1
(
  .Reset(reset),
  .Clk_125M(clk125),
  .Clk_user(clk128),
  .Clk_reg(clk128),
  .Speed(mac_speed),
  .ff_rx_rdy(rdy),	//1'b1: Always Ready
  .ff_rx_data(ff_rx_data_mac3),
  .ff_rx_mod(ff_rx_mod_mac3),
  .ff_rx_sop(ff_rx_sop_mac3),
  .ff_rx_eop(ff_rx_eop_mac3),
  .ff_rx_dsav(ff_rx_dsav_mac3),	//Output not to be uesd directly
  .ff_rx_dval(ff_rx_dval_mac3),
  .rx_err(rx_err_mac3),
  .ff_tx_data(),
  .ff_tx_mod(),
  .ff_tx_sop(),
  .ff_tx_eop(),
  .ff_tx_wren(),
  .ff_tx_err(),
  .tx_ff_uflow(),	//Output1 for TX ports
  .ff_tx_rdy(),
  .ff_tx_septy(),  	//Output2 for TX ports
  .Rx_clk(Rx_clk),
  .Tx_clk(),
  .Tx_er(),
  .Tx_en(),
  .Txd(),		//Blank when its data isn't needed 
  .Rx_er(hm_Rx_er3),
  .Rx_dv(hm_Tx_en2),	//Active
  .Rxd(hm_Txd2),		//Blank when its data isn't needed
  .Crs(1'b0),
  .Col(1'b0),
  .CSB(mac_csb),
  .WRB(mac_wrb),
  .CD_in(mac_cd_in),
  .CD_out(mac_cd_out),
  .CA(mac_ca));
  



data_cmp U_data_cmp(
	.Rx_clk(Rx_clk)	, 
	.Tx_clk(Tx_clk)	, 
	.Tx_er ()	, 
	.Tx_en (hm_Tx_en)	, 
	.Txd   (hm_Txd)	,
	.Rx_er (hm_Rx_er)	, 
	.Rx_dv (hm_Rx_dv)	, 
	.Rxd   (hm_Rxd)	,
    .reset (reset),
    .testcase_name(testcase_name),	
	.mode  (mode)	
	);
  
integer i = 0;
integer len = 0;
integer data_cnt = 1;
initial
begin
	mac_ca = 8'b0;
	mac_cd_in = 16'b0;
	rdy=1'b0;
	mac_csb = 1'b1;
	mac_wrb = 1'b1;
	mode=1'b0;
	mode_switch=0;

	#800;
	rdy=1'b1;
	`include "../testcase/0100000064.v"
    `include "../testcase/0100000065.v"
	// `include "../testcase/0100000066.v"
	// `include "../testcase/0100000067.v"
	// `include "../testcase/0100000068.v"
	

	#10000;

	$stop;
end

// dump fsdb file for debussy
// initial
// begin
  // $fsdbDumpfile("mac.fsdb");
  // $fsdbDumpvars;
// end


/* initial
begin
//    $dumpfile("mac.vcd");
//    $dumpvars; 
    $vcdpluson;
    #12000000;
    $finish;
end */

endmodule

