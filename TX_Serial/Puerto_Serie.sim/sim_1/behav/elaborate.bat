@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 186a567cf2914d8a89ee3b57be2e3b5c -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot UART_RX_behav xil_defaultlib.UART_RX -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
