if { $argc != 0 } {
	vlog -work      work   -f   FileList.lst
	restart
	log -r /*
	run -all
} else {

#退出仿真，清空命令行
    quit -sim
    .main clear

#在根目录下建立库文件
    vlib ./lib/
    vlib ./lib/work

#库文件地址映射
    vmap    work   ./lib/work

vlib work
vlog -f  ../filelist/sim_filelist.v
vlog -f  ../filelist/hdl_filelist.v  -cover bcesxf
vsim -voptargs=+acc -coverage work.testbench

do ./wave.do


run -all

}

