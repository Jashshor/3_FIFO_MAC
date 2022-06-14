
U_clockGenerator.RESET;


testcase_name = "0100000064" ;
mode=1'b0;
CHOOSE_MODE;
#100;
   i=0;
repeat(100)
begin
   data_cnt= i;
   len = 64 + {$random}%(1518 - 64);
   U_ephy_hm.send_frame_100M(len, i);
   $display("%d   %d",$realtime, data_cnt);
   i = i + 1;
	// data_cnt = data_cnt + 1'b1;
end

$display("\n %d %s is done!!!-----------------------------------------",$realtime, testcase_name);
#1000;                     
U_data_cmp.OVER;