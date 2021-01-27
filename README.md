# Serial-Basys3
This is a VHDL proyect to receive and send data from the serial on the Basys 3, process the data and move the respected finger. The data is divided in two parts, the id and the angle, the two off them are sent independently one per byte. 

![Alt text](/img/Data.png?raw=true "Data")

## Pmod RS232

The Pmod RS232 communicates with the host board via the UART protocol. The arrangement of the pins is the old UART communication style (Type 3 in the Digilent Pmod Interface Specification) so that a crossover cable will be required if attaching this Pmod to one of the dedicated UART Pmod headers on any of the newer Digilent microcontroller boards. For a list of which MCU boards use the old UART protocol, see our explanation

![Alt text](https://reference.digilentinc.com/_media/pmod/pmod/rs232/temp2.png "Pmod RS232")

## Xilink Basys3 FPGA
The on-board Pmod expansion port, labeled "JXADC", is wired to the auxiliary analog input pins of the FPGA. Depending on the configuration, this connector can be used to input differential analog signals to the analog-to-digital converter inside the Artix-7 (XADC). Any or all pairs in the connector can be configured either as analog input or digital input-output. 

The Dual Analog/Digital Pmod on the Basys 3differs from the rest in the routing of its traces. The eight data signals are grouped into four pairs, with the pairs routed closely coupled for better analog noise immunity. Furthermore, each pair has a partially loaded anti-alias filter laid out on the PCB. The filter does not havecapacitors C33-C36. In designs where such filters are desired, the capacitors can be manually loaded by the user.

NOTE: The coupled routing and the anti-alias filters might limit the data speeds when used for digital signals.

The XADC core within the Artix-7 is a dual channel 12-bit analog-to-digital converter capable of operating at 1 MSPS. Either channel can be driven by any of the auxiliary analog input pairs connected to the JXADC header. The XADC core is controlled and accessed from a user design via the Dynamic Reconfiguration Port(DRP). The DRP also provides access to voltage monitors that are present on each of the FPGA's power rails, and a temperature sensor that is internal to the FPGA. For more information on using the XADC core, refer to the Xilinx document titled "7 Series FPGAs and Zynq-7000 All Programmable SoC XADC Dual 12-Bit 1 MSPS Analog-to-Digital Converter."

![Alt text](/img/Basys3-pinout.png?raw=true "Basys3 Pin-Out")

## Top
This is the main system chart
![Alt text](/img/Top.png?raw=true "Top")

## Memoria
This is how it works the data_memoria component, saving the id and angle and checking if the id introduced is correct and it is between 100 and 109 wich is the same as A to J
![Alt text](/img/Memoria.png?raw=true "Memoria")
![Alt text](/img/Mano.png?raw=true "Mano")

## Display Refresh
![Alt text](/img/Display.png?raw=true "Refresh")
