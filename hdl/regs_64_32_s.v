// **************************************************************
// COPYRIGHT(c)2011, ISN Lab, Xidian University
// All rights reserved.
//
// IP LIB INDEX  :  MEM --> REGS
// IP Name       :  HIMAC	
// File name     :  .v    
// Module name   :  
// Full name     :  small memory use DFFs
//
// Author        :  panweitao 
// Email         :  panweitao@163.com
// Data          :  2011.6.23 20:48:13
// Version       :  V 1.0 
// 
//Abstract       :
// Called by     :  
// 
// Modification history
// ------------------------------------------------------------------------------------------------------
// //
// $Log$
//
// *********************************************************************
`include	"top_define.v"
//  *****************************       
//   DEFINE MODULE PORT  //             
//  ******************************  
//
module regs_64_32_s (
                           //input
                           dffs_clk  ,
                           dffs_rst_n,         
                           dffs_wen   ,
                           dffs_waddr ,
                           dffs_wdata ,
                           dffs_raddr ,
                           //output
                           dffs_rdata
                            );


//  *****************************
//   DEFINE PARAMETER  // 
//  ******************************
parameter            ADDR    =  6      ;    // address width of FIFO (3 if 8,4 if 16,5 if 32)
parameter            WORDS   =  64     ;    // decimal depth of FIFO (8, 16, 32)
parameter            W_SIZE  =  32     ;    // size of words (8, 16, 24 or 32)

//  ******************************
//  DEFINE INPUT
//  ******************************   
input                dffs_clk        ;    //write clock input
input                dffs_rst_n      ;    //write reset input
                                            
input                dffs_wen         ;    //write enable signal
input  [  ADDR-1:0]  dffs_waddr       ;    //write address
input  [W_SIZE-1:0]  dffs_wdata       ;    //write data bus

//input  dffs_ren;  //read enable signal
input  [  ADDR-1:0]  dffs_raddr       ;    //read address bus

//  ******************************
//  DEFINE OUTPUT  // 
//  ******************************
output [W_SIZE-1:0]  dffs_rdata       ;    //read data bus

reg [W_SIZE-1:0]  dffs_rdata       ;    //read data bus
wire    [W_SIZE-1:0]    dffs_raddr_hold;
// *********************
// INNER SIGNAL DECLARATION
// *********************  
//////////////////////////////////////////////////////////////////////
// define the memory cell
// number of words = WORDS
// and number of bits per word = W_SIZE
/////////////////////////////////////////////////////////////////////
reg    [(W_SIZE-1):0]  fifo_data [(WORDS-1):0]; // FIFO data registers

//reg    [  ADDR-1:0]    dffs_raddr_hold;

reg    [31:0]             i                      ; // indexing variable

//  ******************************
// MAIN CODE  //                  
//  ******************************

//////////////////////////////////////////////////////////////////////
// memory write input logic
/////////////////////////////////////////////////////////////////////
// Assign sync FIFO input at address of current write pointer

always @ (posedge dffs_clk or negedge dffs_rst_n)
begin
    if (~dffs_rst_n)
        for (i = 0; i <= (WORDS-1); i = i + 1)
        fifo_data[i] <= 0;           
    else if (dffs_wen)
        begin
        fifo_data[dffs_waddr] <= #`DELAYTIME  dffs_wdata;
	end
end   


//////////////////////////////////////////////////////////////////////
// memory read output logic
/////////////////////////////////////////////////////////////////////       
// Assign async FIFO output at address of current read pointer

always @ (posedge dffs_clk or negedge dffs_rst_n)
begin
   if (dffs_rst_n == 1'b0)
       dffs_rdata <= 0;
   else    
       dffs_rdata <= #`DELAYTIME dffs_raddr_hold;
end  


 assign dffs_raddr_hold = fifo_data[dffs_raddr];

  
endmodule
