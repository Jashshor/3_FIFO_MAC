::�رջ���
::@ECHO OFF
::�������·��
::SET debussy=D:\Novas\Debussy\bin\Debussy.exe
::SET vsim=C:\modeltech64_10.5\win64\modelsim.exe
::ModelSim Command
::%vsim% -c -do sim.do

set PROJECT_PATH=%cd%
vsim  -do  sim.do

::ɾ��ModelSim���ɵ�����ļ�
RD work /s /q
::RD lib /s /q
DEL transcript vsim.wlf /q
DEL transcript vsim_stacktrace.vstf /q


::Debussy Command
::%debussy% -f rtl.f -ssf switch.fsdb -2001
::ɾ�������ļ�
::DEL wave.fsdb /q
::ɾ��Debussy���ɵ�����ļ�
::RD Debussy.exeLog  /s /q
::DEL debussy.rc /q
::�˳�������
::EXIT