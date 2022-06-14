`timescale 1ns/1ps

module ephy(
  input GTx_clk,
  output reg Rx_clk,
  output reg Tx_clk,
  output reg Rx_er,
  output reg Rx_dv,
  output reg [7:0] Rxd,
  output reg Crs,
  output reg Col,
  input mode);   // mode = 0, 100M, mode = 1, 1000M

reg clk25;

initial
begin
    clk25 = 0;
    Rx_clk = 0;
    Tx_clk = 0;
    Rx_er = 0;
    Rx_dv = 0;
    Rxd = 0;
    Crs = 0;
    Col = 0; 
end

always #20 clk25 = ~clk25;

always @ ( * )
begin
    if (mode == 1'b0)
    begin
        Tx_clk = clk25;
        Rx_clk = clk25;
    end
    else
    begin
        Tx_clk = GTx_clk;
        Rx_clk = GTx_clk;
    end
end


task send_frame_100M;
input [10:0] frame_length;
input [15:0] data;
begin
    premble_100M;
    pad_100M(frame_length, data);
    #960;
end
endtask

task send_frame_1000M;
input [10:0] frame_length;
input [15:0] data;
begin
    premble_1000M;
    pad_1000M(frame_length, data);
    #5000;
end
endtask


task premble_100M;
begin
    @(posedge Rx_clk)
    Rx_dv = 1;
    Rxd = 8'h05;
    @(posedge Rx_clk)
    Rxd = 8'h05;
    @(posedge Rx_clk)
    Rxd = 8'h05;
    @(posedge Rx_clk)
    Rxd = 8'h05;
    @(posedge Rx_clk)
    Rxd = 8'h05;
    @(posedge Rx_clk)
    Rxd = 8'h05;
    @(posedge Rx_clk)
    Rxd = 8'h05;
    @(posedge Rx_clk)
    Rxd = 8'h05;
    @(posedge Rx_clk)
    Rxd = 8'h05;
    @(posedge Rx_clk)
    Rxd = 8'h05;
    @(posedge Rx_clk)
    Rxd = 8'h05;
    @(posedge Rx_clk)
    Rxd = 8'h05;
    @(posedge Rx_clk)
    Rxd = 8'h05;
    @(posedge Rx_clk)
    Rxd = 8'h05;
    @(posedge Rx_clk)
    Rxd = 8'h05;
    @(posedge Rx_clk)
    Rxd = 8'h0d;
end
endtask


task premble_1000M;
begin
    @(posedge Rx_clk)
    Rx_dv = 1;
    Rxd = 8'h55;
    @(posedge Rx_clk)
    Rxd = 8'h55;
    @(posedge Rx_clk)
    Rxd = 8'h55;
    @(posedge Rx_clk)
    Rxd = 8'h55;
    @(posedge Rx_clk)
    Rxd = 8'h55;
    @(posedge Rx_clk)
    Rxd = 8'h55;
    @(posedge Rx_clk)
    Rxd = 8'h55;
    @(posedge Rx_clk)
    Rxd = 8'hd5;
end
endtask

task pad_100M;
input [15:0] length;
input [15:0] data;
reg [15:0] cnt;
begin
    cnt = 16'h01;
    repeat(6) 
    begin
        @(posedge Rx_clk) 
            Rxd = {4'h0,4'hf};
        @(posedge Rx_clk) 
            Rxd = {4'h0,4'hf};
    end
    repeat(6) 
    begin
        @(posedge Rx_clk) 
            Rxd = {4'h0,4'h0};
        @(posedge Rx_clk) 
            Rxd = {4'h0,4'h1};
    end	
    repeat ((length - 12) / 2) 
    begin
        @(posedge Rx_clk) 
            Rxd = {4'h0,data[15:12]};
        @(posedge Rx_clk) 
            Rxd = {4'h0,data[11:8]};
        @(posedge Rx_clk) 
            Rxd = {4'h0,data[7:4]};
        @(posedge Rx_clk) 
            Rxd = {4'h0,data[3:0]};			
	    cnt = cnt + 1;
    end	
    @(posedge Rx_clk)
    Rx_dv = 0;
end
endtask


task pad_1000M;
input[15:0] length;
input [15:0] data;
begin
    repeat(6) 
    begin
        @(posedge Rx_clk) 
            Rxd = 8'hff;
    end
    repeat(6) 
    begin
        @(posedge Rx_clk) 
            Rxd = 8'h01;
    end	
    repeat((length - 14) / 2) 
    begin
        @(posedge Rx_clk) 
            Rxd = data[15:8];
        @(posedge Rx_clk) 
            Rxd = data[7:0];
	end
	repeat(2)
	begin
        @(posedge Rx_clk) 
            Rxd = 8'h55;
        @(posedge Rx_clk) 
            Rxd = 8'hAA;
	end
    @(posedge Rx_clk)
    Rx_dv = 0;
end
endtask

endmodule