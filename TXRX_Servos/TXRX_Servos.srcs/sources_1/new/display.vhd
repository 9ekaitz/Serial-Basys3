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
           seg_out : out STD_LOGIC_VECTOR (7 downto 0));
end display7;

architecture Behavioral of display7 is

begin

--an_out<="1110";
--seg_out<=   "0000001" when (signal_in = "00110000") else --0
--            "1001111" when (signal_in = "00110001") else --1
--            "0010010" when (signal_in = "00110010") else --2
--            "0000110" when (signal_in = "00110011") else --3
--            "1001100" when (signal_in = "00110100") else --4
--            "0100100" when (signal_in = "00110101") else --5
--            "0100000" when (signal_in = "00110110") else --6
--            "0001111" when (signal_in = "00110111") else --7
--            "0000000" when (signal_in = "00111000") else --8
--            "0000100" when (signal_in = "00111001")      --9
--            else "1111110";                              -- -

--seg_out<=   "0000001" when (signal_in = "00000000") else --0
--            "1001111" when (signal_in = "00000001") else --1
--            "0010010" when (signal_in = "00000010") else --2
--            "0000110" when (signal_in = "00000011") else --3
--            "1001100" when (signal_in = "00000100") else --4
--            "0100100" when (signal_in = "00000101") else --5
--            "0100000" when (signal_in = "00000110") else --6
--            "0001111" when (signal_in = "00000111") else --7
--            "0000000" when (signal_in = "00001000") else --8
--            "0000100" when (signal_in = "00001001")      --9
--            else "1111110";           

with signal_in select
seg_out<=not "00111111" when "0000",
        not "00000110" when "0001",
        not "01011011" when "0010",
        not "01001111" when "0011",
        not "01100110" when "0100",
        not "01101101" when "0101",
        not "01111101" when "0110",
        not "00000111" when "0111",
        not "01111111" when "1000",
        not "01101111" when "1001",
        not "01111001" when others;


end Behavioral;