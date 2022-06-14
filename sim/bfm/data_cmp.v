`timescale 1ns/1ps

module data_cmp(
Rx_clk, 
Tx_clk, 
Tx_er , 
Tx_en , 
Txd   ,
Rx_er , 
Rx_dv , 
Rxd   ,
mode,
reset,
testcase_name
);

input Rx_clk; 
input Tx_clk; 
input Tx_er ; 
input Tx_en ; 
input [7:0]Txd   ;
input Rx_er ; 
input Rx_dv ; 
input [7:0]Rxd   ;
input mode;
input reset;
input [200:1] testcase_name;


reg  Rx_dv_delay;
reg  Tx_en_delay;

integer File_handle1;
integer File_handle2;
reg[15:0] frm_cnt1;
reg[15:0] frm_cnt2;

reg[15:0] cnt1; //print format
reg[15:0] cnt2;


always @ (negedge reset)
begin
    if(reset==1'b0 && testcase_name!=0)
        INITIAL_DATA_CMP;
end

task INITIAL_DATA_CMP;
begin
	frm_cnt1 = 1;
	frm_cnt2 = 1;
	cnt1 = 0;  
	cnt2 = 0;
	File_handle1 = $fopen({"../in_out/",testcase_name,"_indata.log"}); 
   // if(!File_handle1)
      // $display("could not open mii_in.txt");
	// File_handle2 = $fopen("E:/vproject/new_mac/sim/in_out/mii_out.txt"); 
	File_handle2 = $fopen({"../in_out/",testcase_name,"_outdata.log"}); 	
   // if(!File_handle2)
      // $display("could not open mii_out.txt");
end
endtask  


task OVER;
begin                    
    $fclose(File_handle1); 
    $fclose(File_handle2);

    $display("hdhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"); 
     
    disable INITIAL_DATA_CMP;
end
endtask  

always@(posedge Rx_clk)
begin
	Rx_dv_delay <= Rx_dv;
end

always@(posedge Rx_clk)
begin
	Tx_en_delay <= Tx_en;
end

always@(posedge Rx_clk)
begin
	if(Rx_dv && !Rx_dv_delay) begin
	    cnt1 = 1;
		$fwrite(File_handle1,"frame %d   ",frm_cnt1);
		if (mode)
		    $fwrite(File_handle1,"%x",Rxd);
	    else
		    $fwrite(File_handle1,"%x",Rxd[3:0]);
		cnt1 =cnt1 + 1;
	end
	else if(Rx_dv) begin
	    if(cnt1%8==0) begin
			if (mode)
			begin
				$fwrite(File_handle1,"%x",Rxd);
			end
			else
			begin
				$fwrite(File_handle1,"%x",Rxd[3:0]);
			end
			$fwrite(File_handle1," ");
		end
		else
			if (mode)
				$fwrite(File_handle1,"%x",Rxd);
			else
				$fwrite(File_handle1,"%x",Rxd[3:0]);
		cnt1 = cnt1 + 1;
	end
	else if(!Rx_dv && Rx_dv_delay) begin
	    $fwrite(File_handle1,"\n");
	    frm_cnt1 =frm_cnt1 + 1;
		cnt1 = cnt1 + 1;
	end
end

always@(posedge Tx_clk)
begin
	if(Tx_en && !Tx_en_delay) begin
	    cnt2 = 1;
		$fwrite(File_handle2,"frame %d   ",frm_cnt2);
		if (mode)
		    $fwrite(File_handle2,"%x",Txd);
	    else
		    $fwrite(File_handle2,"%x",Txd[3:0]);
		cnt2 = cnt2 + 1;
	end
	else if(Tx_en) begin
		if(cnt2%8==0) begin
			if (mode)
			begin
				$fwrite(File_handle2,"%x",Txd);
			end
			else
			begin
				$fwrite(File_handle2,"%x",Txd[3:0]);
			end
			$fwrite(File_handle2," ");
		end
		else 
			if (mode)
				$fwrite(File_handle2,"%x",Txd);
			else
				$fwrite(File_handle2,"%x",Txd[3:0]);
		cnt2 = cnt2 + 1;
	end
	else if(!Tx_en && Tx_en_delay) begin
	    $fwrite(File_handle2,"\n");
	    frm_cnt2 =frm_cnt2 + 1;
	end
end

endmodule
