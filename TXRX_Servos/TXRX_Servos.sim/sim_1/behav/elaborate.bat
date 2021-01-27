@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 4d8a0a9c090e40cea4ddd47f40860208 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot PMW_Controller_tb_behav xil_defaultlib.PMW_Controller_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
