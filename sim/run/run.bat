::关闭回显
::@ECHO OFF
::设置软件路径
::SET debussy=D:\Novas\Debussy\bin\Debussy.exe
::SET vsim=C:\modeltech64_10.5\win64\modelsim.exe
::ModelSim Command
::%vsim% -c -do sim.do

set PROJECT_PATH=%cd%
vsim  -do  sim.do

::删除ModelSim生成的相关文件
RD work /s /q
::RD lib /s /q
DEL transcript vsim.wlf /q
DEL transcript vsim_stacktrace.vstf /q


::Debussy Command
::%debussy% -f rtl.f -ssf switch.fsdb -2001
::删除波形文件
::DEL wave.fsdb /q
::删除Debussy生成的相关文件
::RD Debussy.exeLog  /s /q
::DEL debussy.rc /q
::退出命令行
::EXIT