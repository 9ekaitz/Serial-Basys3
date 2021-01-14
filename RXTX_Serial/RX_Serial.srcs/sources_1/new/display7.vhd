----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.12.2020 19:55:26
-- Design Name: 
-- Module Name: Dekod_7 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display7 is
    Port ( signal_in : in STD_LOGIC_VECTOR (7 downto 0);
           an_in : in STD_LOGIC_VECTOR (3 downto 0);
           an_out : out STD_LOGIC_VECTOR (3 downto 0);
           seg_out : out STD_LOGIC_VECTOR (6 downto 0));
end display7;

architecture Behavioral of display7 is

begin

seg_out<=   "0000001" when (signal_in = "00110000") else --0
            "1001111" when (signal_in = "00110001") else --1
            "0010010" when (signal_in = "00110010") else --2
            "0000110" when (signal_in = "00110011") else --3
            "1001100" when (signal_in = "00110100") else --4
            "0100100" when (signal_in = "00110101") else --5
            "0100000" when (signal_in = "00110110") else --6
            "0001111" when (signal_in = "00110111") else --7
            "0000000" when (signal_in = "00111000") else --8
            "0000100" when (signal_in = "00111001")      --9
            else "1111110";                              -- -

an_out<= not an_in;

end Behavioral;