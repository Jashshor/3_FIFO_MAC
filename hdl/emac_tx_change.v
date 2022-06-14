`include    "top_define.v"
module emac_tx_change(
        Reset,
        Clk_user,

//original interface
        Tx_mac_wa               ,
        Tx_mac_wr               ,
        Tx_mac_data             ,
        Tx_mac_BE               ,
        Tx_mac_sop              ,
        Tx_mac_eop              ,

        Fifo_data_err_empty  ,
        AlmostFull,
//to be modified interface        
        ff_tx_data,
        ff_tx_mod,
        ff_tx_sop,
        ff_tx_eop,
        ff_tx_wren,
        ff_tx_err,
        tx_ff_uflow,
        ff_tx_rdy,
        ff_tx_septy
);


input        Reset;
input        Clk_user;

//original interface
input           Tx_mac_wa               ;
output          Tx_mac_wr               ;
output  [31:0]  Tx_mac_data             ;
output  [1:0]   Tx_mac_BE               ;
output          Tx_mac_sop              ;
output          Tx_mac_eop              ;

input Fifo_data_err_empty  ;
input AlmostFull;

//to be modified interface
input  [31:0]   ff_tx_data;
input  [1:0]    ff_tx_mod;
input           ff_tx_sop;
input           ff_tx_eop;
input           ff_tx_wren;
input           ff_tx_err;
output          tx_ff_uflow;
output          ff_tx_rdy;
output          ff_tx_septy;

reg          Tx_mac_wr;
reg [31:0]   Tx_mac_data;
reg [1:0]    Tx_mac_BE;
reg          Tx_mac_sop;
reg          Tx_mac_eop;
reg          tx_ff_uflow;
reg          ff_tx_rdy;
reg          ff_tx_septy;

always @ (posedge Reset or posedge Clk_user)                 
    if (Reset) 
        begin
            Tx_mac_data <= 32'd0;
            Tx_mac_BE <= 2'd0;
            Tx_mac_sop <= 1'b0;
            Tx_mac_eop <= 1'b0;
            Tx_mac_wr <= 1'b0;
            ff_tx_rdy <= 1'b0;
            tx_ff_uflow <= 1'b0;
            ff_tx_septy <= 1'b0;
        end
    else 
        begin
            Tx_mac_data <= ff_tx_data;
            Tx_mac_BE <= ff_tx_mod;
            Tx_mac_sop <= ff_tx_sop;
            Tx_mac_eop <= ff_tx_eop;
            Tx_mac_wr <= ff_tx_wren;
            ff_tx_rdy <= ~AlmostFull;  //????
            tx_ff_uflow <= Fifo_data_err_empty;
            ff_tx_septy <= Tx_mac_wa;
        end

/*
always @ (posedge Reset or posedge Clk_user)                 
    if (Reset) 
        begin
            Rx_mac_rd <= 1'b0;      
        end
    else 
        begin
            if(Rx_mac_ra && ff_rx_rdy)
                Rx_mac_rd <= 1'b1;
            else 
                Rx_mac_rd <= 1'b0;
        end
*/

endmodule