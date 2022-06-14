/////////////////////////////////////////////////////////////////////////////
////                        宏定义模块                                   ////
////外部接口：无                                                         ////
////功能描述：宏定义代码中的变量参数                                     ////
////版本    : 2008.5.8                                                   ////
////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ps
//delay time 

//scheduler_top delay
//`define   		DELAYTIME 				1
`define   		DELAYTIME 				0
//`define   		MC_DELAY 				1
`define   		MC_DELAY 				0

//`define			FRAME_LENGTH			11
`define			RAM_ADDRESS_LEN		    11
`define         SR_FIFO_DATA_WIDTH      48      ///zhanglei 11.9
`define         RX_FIFO_DATA_WIDTH      40     ///zhanglei 11.9
//`define			FF_DEPTH				16
`define			FF_DEPTH				17      ///// 256 DB
`define			BUS_DATA_W  			32
`define			SSRAM_ADDRESS_LEN		12     ////zl 11.1





`define  EMAC_ID  8'd33
`define  MULTI_ID  8'hff
`define	 FREE_LIST_ID		 8'd254
//`define  DT  1
`define  DT  0

`define	  LEN_RAM_ADDR_WIDTH    8
`define   LEN_RAM_BYTEENA_WIDTH 6
`define	  LEN_RAM_DATA_WIDTH    48	
//CAM module
//`define  LIVE_TIME  300   //It's 300s 300 个周期
`define  LIVE_TIME  511   //prolong the delete time for test popuse --gong 1231
`define  FRESH_TIME  29'd20000_0000  //   29'd10000_0000 is correct,means 1s

//qm module use  
`define   FRAME_LENGTH 11
//`define   qm_pointer   7
//`define   QM_MEM_ADDRESS_WIDTH 7
`define   qm_pointer   11          ////zhanglei 9.4
`define   QM_MEM_ADDRESS_WIDTH 16  ////zhanglei 11.12
`define   QM_MEM_DATA_WIDTH  32

`define   OQD_RAM_ADDRESS_WIDTH   8    ////zhanglei 9.3
`define   OQD_RAM_DATA_WIDTH      144
`define   BD_RAM_ADDRESS_WIDTH      16
`define   BD_RAM_BYTEENA_WIDTH  4
`define   BD_RAM_DATA_WIDTH  32
`define   FQD_RAM_DATA_WIDTH  64
`define   FQD_RAM_ADDRESS_WIDTH 5
`define   HIGH_PRI_LEN   1024
`define   MID_PRI_LEN    512
`define   LOW_PRI_LEN    512
`define   EMAC_QUE_LEN   512
/***************************************INSIDE RAM*****************************************/ 
//inside ram
//`define	  FF_DEPTH	         16
/********************************************************************************/
`define		MEM_ADDR_W	     21 
`define		MEM_DATA_W	     32
`define		FR_LEN_W	     16
/********************************************************************************/
//长度信息，Dd、Du信息在cpu中的存储位置
//`define   CPU_CONTROL_ADDR   11'b00000000000
//控制信息在cpu中的起始位置
`define   CPU_CONTROL_ADDR   11'b00000000001
`define   PHY_RXDATA_LEN     11'b00000000010
`define   PHY_CONTROL_ADDR   11'b00000000001
`define   PHY_TXDATA_ADDR    11'b00000000010
`define   PHY_RXDATA_ADDR    11'b00000000010
//HIMAC帧在发送DPRAM中的起始位置
`define   DPRAM_TXDATA_ADDR    11'b00000000000
//HIMAC帧在接收DPRAM中的起始位置
`define   DPRAM_RXDATA_ADDR    11'b00000000000

////zl  6.7
// `define QUEUE_NUM_WIDTH   6
`define QUEUE_NUM_WIDTH   8
`define QUEUE_NUM         198
`define QUEUE_NUM_HALF    99

`define   RF_ADDRESS_WIDTH   8    ////zhanglei 9.3
`define   RF_DATA_WIDTH      128

    `define MAC_SOURCE_REPLACE_EN           1
    `define MAC_TARGET_CHECK_EN             1
    `define MAC_BROADCAST_FILTER_EN         1
    `define MAC_TX_FF_DEPTH 		    10
    `define MAC_RX_FF_DEPTH 		    10
