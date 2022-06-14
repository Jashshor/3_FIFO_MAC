`include	"top_define.v"
module Reg_int (
input                   Reset                   ,
input                   Clk_reg                 ,
input                   CSB                     ,
input                   WRB                     ,
input           [15:0]  CD_in                   ,
output   reg    [15:0]  CD_out                  ,
input           [7:0]   CA                      ,
                        //Tx host interface 
output          [5:0]   Tx_Hwmark               ,
output          [5:0]   Tx_Lwmark               ,   
output                  pause_frame_send_en     ,               
output          [15:0]  pause_quanta_set        ,
output                  MAC_tx_add_en           ,               
output                  FullDuplex              ,
output          [3:0]   MaxRetry                ,
output          [5:0]   IFGset                  ,
output          [7:0]   MAC_tx_add_prom_data    ,
output          [2:0]   MAC_tx_add_prom_add     ,
output                  MAC_tx_add_prom_wr      ,
output                  tx_pause_en             ,
output                  xoff_cpu                ,
output                  xon_cpu                 ,
                        //Rx host interface     
output                  MAC_rx_add_chk_en       ,   
output          [7:0]   MAC_rx_add_prom_data    ,   
output          [2:0]   MAC_rx_add_prom_add     ,   
output                  MAC_rx_add_prom_wr      ,   
output                  broadcast_filter_en     ,
output          [15:0]  broadcast_bucket_depth              ,
output          [15:0]  broadcast_bucket_interval           ,
output                  RX_APPEND_CRC           ,
output          [5:0]   Rx_Hwmark           ,
output          [5:0]   Rx_Lwmark           ,
output                  CRC_chk_en              ,               
output          [5:0]   RX_IFG_SET              ,
output          [15:0]  RX_MAX_LENGTH           ,// 1518
output          [6:0]   RX_MIN_LENGTH           ,// 64
                        //RMON host interface
output          [5:0]   CPU_rd_addr             ,
output                  CPU_rd_apply            ,
input                   CPU_rd_grant            ,
input           [31:0]  CPU_rd_dout             ,
                        //Phy int host interface     
output                  Line_loop_en            ,
output          [2:0]   Speed                   ,
                        //MII to CPU 
output          [7:0]   Divider                 ,// Divider for the host clock
output          [15:0]  CtrlData                ,// Control Data (to be written to the PHY reg.)
output          [4:0]   Rgad                    ,// Register Address (within the PHY)
output          [4:0]   Fiad                    ,// PHY Address
output                  NoPre                   ,// No Preamble (no 32-bit preamble)
output                  WCtrlData               ,// Write Control Data operation
output                  RStat                   ,// Read Status operation
output                  ScanStat                ,// Scan Status operation
input                   Busy                    ,// Busy Signal
input                   LinkFail                ,// Link Integrity Signal
input                   Nvalid                  ,// Invalid Status (qualifier for the valid scan result)
input           [15:0]  Prsd                    ,// Read Status Data (data read from the PHY)
input                   WCtrlDataStart          ,// This signals resets the WCTRLDATA bit in the MIIM Command register
input                   RStatStart              ,// This signal resets the RSTAT BIT in the MIIM Command register
input                   UpdateMIIRX_DATAReg     // Updates MII RX_DATA register with read data
);

wire [15:0] out0  ;
wire [15:0] out1  ;
wire [15:0] out2  ;
wire [15:0] out3  ;
wire [15:0] out4  ;
wire [15:0] out5  ;
wire [15:0] out6  ;
wire [15:0] out7  ;
wire [15:0] out8  ;
wire [15:0] out9  ;
wire [15:0] out10 ;
wire [15:0] out11 ;
wire [15:0] out12 ;
wire [15:0] out13 ;
wire [15:0] out14 ;
wire [15:0] out15 ;
wire [15:0] out16 ;
wire [15:0] out17 ;
wire [15:0] out18 ;
wire [15:0] out19 ;
wire [15:0] out20 ;
wire [15:0] out21 ;
wire [15:0] out22 ;
wire [15:0] out23 ;
wire [15:0] out24 ;
wire [15:0] out25 ;
wire [15:0] out26 ;
wire [15:0] out27 ;
wire [15:0] out28 ;
wire [15:0] out29 ;
wire [15:0] out33 ;
wire [15:0] out34 ;


    RegCPUData U_0_000(out0 , 7'd000,16'd60,Reset,Clk_reg,!WRB,CSB,CA,CD_in);     // Tx_Hwmark                
    RegCPUData U_0_001(out1 , 7'd001,16'd40,Reset,Clk_reg,!WRB,CSB,CA,CD_in);     // Tx_Lwmark                
    RegCPUData U_0_002(out2 , 7'd002,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // pause_frame_send_en      
    RegCPUData U_0_003(out3 , 7'd003,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // pause_quanta_set         
    RegCPUData U_0_004(out4 , 7'd004,16'h000c,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // IFGset                   
    RegCPUData U_0_005(out5 , 7'd005,16'h0001,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // FullDuplex               
    RegCPUData U_0_006(out6 , 7'd006,16'h0002,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // MaxRetry                 
    RegCPUData U_0_007(out7 , 7'd007,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // MAC_tx_add_en            
    RegCPUData U_0_008(out8 , 7'd008,16'hffff,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // MAC_tx_add_prom_data     
    RegCPUData U_0_009(out9 , 7'd009,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // MAC_tx_add_prom_add      
    RegCPUData U_0_010(out10, 7'd010,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // MAC_tx_add_prom_wr       
    RegCPUData U_0_011(out11, 7'd011,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // tx_pause_en              
    RegCPUData U_0_012(out12, 7'd012,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // xoff_cpu                 
    RegCPUData U_0_013(out13, 7'd013,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // xon_cpu                  
    RegCPUData U_0_014(out14, 7'd014,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // MAC_rx_add_chk_en        
    RegCPUData U_0_015(out15, 7'd015,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // MAC_rx_add_prom_data     
    RegCPUData U_0_016(out16, 7'd016,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // MAC_rx_add_prom_add      
    RegCPUData U_0_017(out17, 7'd017,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // MAC_rx_add_prom_wr       
    RegCPUData U_0_018(out18, 7'd018,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // broadcast_filter_en      
    RegCPUData U_0_019(out19, 7'd019,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // broadcast_bucket_depth   
    RegCPUData U_0_020(out20, 7'd020,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // broadcast_bucket_interval
    RegCPUData U_0_021(out21, 7'd021,16'h0001,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // RX_APPEND_CRC            
    RegCPUData U_0_022(out22, 7'd022,16'h001a,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // Rx_Hwmark                
    RegCPUData U_0_023(out23, 7'd023,16'h0010,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // Rx_Lwmark                
    RegCPUData U_0_024(out24, 7'd024,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // CRC_chk_en               
    RegCPUData U_0_025(out25, 7'd025,16'h000c,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // RX_IFG_SET               
    RegCPUData U_0_026(out26, 7'd026,16'd1530,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // RX_MAX_LENGTH            
    RegCPUData U_0_027(out27, 7'd027,16'h0040,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // RX_MIN_LENGTH            
    RegCPUData U_0_028(out28, 7'd028,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // CPU_rd_addr              
    RegCPUData U_0_029(out29, 7'd029,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // CPU_rd_apply             
    RegCPUData U_0_033(out33, 7'd033,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // Line_loop_en             
    RegCPUData U_0_034(out34, 7'd034,16'h0002,Reset,Clk_reg,!WRB,CSB,CA,CD_in);   // Speed  

assign Tx_Hwmark                  = out0[5:0]      ;
assign Tx_Lwmark                  = out1[5:0]      ;
assign pause_frame_send_en        = out2[0]      ;
assign pause_quanta_set           = out3      ;
assign IFGset                     = out4[5:0]      ;
assign FullDuplex                 = out5[0]      ;
assign MaxRetry                   = out6[3:0]      ;
assign MAC_tx_add_en              = out7[0]      ;
assign MAC_tx_add_prom_data       = out8[7:0]      ;
assign MAC_tx_add_prom_add        = out9[2:0]      ;
assign MAC_tx_add_prom_wr         = out10[0]     ;
assign tx_pause_en                = out11[0]     ;
assign xoff_cpu                   = out12[0]     ;
assign xon_cpu                    = out13[0]     ;
assign MAC_rx_add_chk_en          = out14[0]     ;
assign MAC_rx_add_prom_data       = out15[7:0]     ;
assign MAC_rx_add_prom_add        = out16[2:0]     ;
assign MAC_rx_add_prom_wr         = out17[0]     ;
assign broadcast_filter_en        = out18[0]     ;
assign broadcast_bucket_depth     = out19     ;
assign broadcast_bucket_interval  = out20     ;
assign RX_APPEND_CRC              = out21[0]     ;
assign Rx_Hwmark                  = out22[5:0]     ;
assign Rx_Lwmark                  = out23[5:0]     ;
assign CRC_chk_en                 = out24[0]     ;
assign RX_IFG_SET                 = out25[5:0]     ;
assign RX_MAX_LENGTH              = out26     ;
assign RX_MIN_LENGTH              = out27[6:0]     ;
assign CPU_rd_addr                = out28[5:0]     ;
assign CPU_rd_apply               = out29[0]     ;
assign Line_loop_en               = out33[0]     ;
assign Speed                      = out34[2:0]     ;


always @ (posedge Clk_reg or posedge Reset)
    if (Reset)
        CD_out  <=0;
    else if (!CSB&&WRB)
        case (CA[7:1])
                7'd00:    CD_out<=Tx_Hwmark                  ;
                7'd01:    CD_out<=Tx_Lwmark                  ; 
                7'd02:    CD_out<=pause_frame_send_en        ; 
                7'd03:    CD_out<=pause_quanta_set           ;
                7'd04:    CD_out<=IFGset                     ; 
                7'd05:    CD_out<=FullDuplex                 ; 
                7'd06:    CD_out<=MaxRetry                   ;
                7'd07:    CD_out<=MAC_tx_add_en              ; 
                7'd08:    CD_out<=MAC_tx_add_prom_data       ;
                7'd09:    CD_out<=MAC_tx_add_prom_add        ; 
                7'd10:    CD_out<=MAC_tx_add_prom_wr         ; 
                7'd11:    CD_out<=tx_pause_en                ; 
                7'd12:    CD_out<=xoff_cpu                   ;
                7'd13:    CD_out<=xon_cpu                    ; 
                7'd14:    CD_out<=MAC_rx_add_chk_en          ; 
                7'd15:    CD_out<=MAC_rx_add_prom_data       ;
                7'd16:    CD_out<=MAC_rx_add_prom_add        ; 
                7'd17:    CD_out<=MAC_rx_add_prom_wr         ; 
                7'd18:    CD_out<=broadcast_filter_en        ; 
                7'd19:    CD_out<=broadcast_bucket_depth     ;    
                7'd20:    CD_out<=broadcast_bucket_interval  ;   
                7'd21:    CD_out<=RX_APPEND_CRC              ; 
                7'd22:    CD_out<=Rx_Hwmark                  ; 
                7'd23:    CD_out<=Rx_Lwmark                  ; 
                7'd24:    CD_out<=CRC_chk_en                 ; 
                7'd25:    CD_out<=RX_IFG_SET                 ; 
                7'd26:    CD_out<=RX_MAX_LENGTH              ; 
                7'd27:    CD_out<=RX_MIN_LENGTH              ; 
                7'd28:    CD_out<=CPU_rd_addr                ; 
                7'd29:    CD_out<=CPU_rd_apply               ;
                //7'd30:    CD_out<=CPU_rd_grant               ;
                //7'd31:    CD_out<=CPU_rd_dout[15:0]          ; 
                //7'd32:    CD_out<=CPU_rd_dout[31:16]         ;                 
                7'd33:    CD_out<=Line_loop_en               ;
                7'd34:    CD_out<=Speed                      ; 
                default:  CD_out<=0                          ;
        endcase
    else
        CD_out<=0                          ;
endmodule   



module RegCPUData(
RegOut,   
CA_reg_set, 
RegInit,  
          
Reset,    
Clk,      
CWR_pulse,
CCSB,
CA_reg,     
CD_in_reg
);
output[15:0]    RegOut; 
input[6:0]      CA_reg_set;  
input[15:0]     RegInit;
//
input           Reset;
input           Clk;
input           CWR_pulse;
input           CCSB;
input[7:0]      CA_reg;
input[15:0]     CD_in_reg;
// 
reg[15:0]       RegOut; 

always  @(posedge Reset or posedge Clk)
    if(Reset)
        RegOut      <=RegInit;
    else if (CWR_pulse && !CCSB && CA_reg[7:1] ==CA_reg_set[6:0])  
        RegOut      <=CD_in_reg; 

endmodule 
//reg xon_cpu;
//reg xoff_cpu;

/*
    RegCPUData U_0_012(xoff_cpu                 ,7'd012,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);
    RegCPUData U_0_013(xon_cpu                  ,7'd013,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);
    RegCPUData U_0_003(pause_quanta_set         ,7'd003,16'h0000,Reset,Clk_reg,!WRB,CSB,CA,CD_in);    

always @ (posedge Clk_reg or posedge Reset)
    if (Reset)       
        CD_out  <= 0;      
    else if (!CSB&&WRB)
        case (CA[7:1])               
                7'd12:    CD_out<=xoff_cpu                   ;
                7'd13:    CD_out<=xon_cpu                    ;                
                default:  CD_out<=0                          ;
        endcase
    else
        CD_out<=0                          ;

*/
/*
always @ (posedge Clk_reg or posedge Reset)
    if (Reset)
        begin
            xon_cpu <= 0;
            xoff_cpu <= 0;
        end
    else
        begin

        end
*/

/*
assign Tx_Hwmark				    	=5'h1e;
assign Tx_Lwmark				        =5'h19;
assign Rx_Hwmark				    	=5'h1a;
assign Rx_Lwmark				        =5'h10;
assign pause_frame_send_en		        =1;
//assign pause_quanta_set		            =3;
assign MAC_tx_add_en			        =0;
assign FullDuplex         		        =1;
assign MaxRetry	        	            =2;
assign IFGset					        =18;
assign MAC_tx_add_prom_data	            =0;
assign MAC_tx_add_prom_add		        =0;
assign MAC_tx_add_prom_wr		        =0;
assign tx_pause_en				        =1;
//assign xoff_cpu	        	            =0;
//assign xon_cpu	                        =0;
 
assign MAC_rx_add_chk_en				=0;
assign MAC_rx_add_prom_data             =0;
assign MAC_rx_add_prom_add	            =0;
assign MAC_rx_add_prom_wr	            =0;
assign broadcast_filter_en	            =0;
assign broadcast_MAX	                =10;
assign RX_APPEND_CRC		            =0;
assign CRC_chk_en			            =1;
assign RX_IFG_SET	  		            =18;
assign RX_MAX_LENGTH 		            =1518;
assign RX_MIN_LENGTH		            =64;

assign CPU_rd_addr						=0;
assign CPU_rd_apply	                    =0;
  
assign Line_loop_en						=0;		
assign Speed					        =3'b010;

endmodule    
*/



     