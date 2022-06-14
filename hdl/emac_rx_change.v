`include    "top_define.v"
module emac_rx_change(
        Reset,
        Clk_user,

//original interface
        Rx_mac_ra               ,
        Rx_mac_rd               ,
        Rx_mac_data             ,
        Rx_mac_BE               ,
        Rx_mac_pa               ,
        Rx_mac_sop              ,
        Rx_mac_eop              ,
        Rx_mac_err              ,

//to be modified interface
        ff_rx_rdy,
        ff_rx_data,
        ff_rx_mod,
        ff_rx_sop,
        ff_rx_eop,
        ff_rx_dsav,
        ff_rx_dval,
        rx_err
);


input        Reset;
input        Clk_user;

//original interface
input           Rx_mac_ra               ;
output          Rx_mac_rd               ;
input   [31:0]  Rx_mac_data             ;
input   [1:0]   Rx_mac_BE               ;
input           Rx_mac_pa               ;
input           Rx_mac_sop             ;
input           Rx_mac_eop              ;
input           Rx_mac_err              ;

//to be modified interface
input           ff_rx_rdy;
output [31:0]   ff_rx_data;
output [1:0]    ff_rx_mod;
output          ff_rx_sop;
output          ff_rx_eop;
output          ff_rx_dsav;
output          ff_rx_dval;
output [5:0]    rx_err;

//reg          Rx_mac_rd;
reg [31:0]   ff_rx_data;
reg [1:0]    ff_rx_mod;
reg          ff_rx_sop;
reg          ff_rx_eop;
reg          ff_rx_dsav;
reg          ff_rx_dval;
reg [5:0]    rx_err;

always @ (posedge Reset or posedge Clk_user)                 
    if (Reset) 
        begin
            ff_rx_data <= 32'd0;
            ff_rx_mod <= 2'd0;
            ff_rx_sop <= 1'b0;
            ff_rx_eop <= 1'b0;
            ff_rx_dsav <= 1'b0;
            ff_rx_dval <= 1'b0;
            rx_err <= 6'd0;
        end
    else 
        begin
            ff_rx_data <= Rx_mac_data;
            ff_rx_mod <= Rx_mac_BE;
            ff_rx_sop <= Rx_mac_sop;
            ff_rx_eop <= Rx_mac_eop;
            ff_rx_dsav <= Rx_mac_ra;
            ff_rx_dval <= Rx_mac_pa;
            rx_err <= {5'b00000,Rx_mac_err};
        end


//always @ (posedge Reset or posedge Clk_user)                 
//    if (Reset) 
//        begin
//            Rx_mac_rd <= 1'b0;      
//        end
//    else 
//        begin
//            if(Rx_mac_ra && ff_rx_rdy)
//                Rx_mac_rd <= 1'b1;
//            else 
//                Rx_mac_rd <= 1'b0;
//        end

assign Rx_mac_rd = (Rx_mac_ra && ff_rx_rdy) ? 1'b1 : 1'b0;

endmodule