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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

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

signal zenb: integer;

begin

--zenb <= conv_integer(signed(signal_in));

--with zenb select
--seg_out<= not "00111111" when 0,
--          not "00000110" when 1,
--          not "01011011" when 2,
--          not "01001111" when 3,
--          not "01100110" when 4,
--          not "01101101" when 5,
--          not "01111101" when 6,
--          not "00000111" when 7,
--          not "01111111" when 8,
--          not "01101111" when 9,
--          not "01111001" when others;
--          "10001000" when  100, -- A
--          "10000011" when 101, -- b
--          "11000110" when 102, -- C
--          "10100001" when 103, -- d
--          "10001101" when 104, -- E
--          not "01111001" when others;

with signal_in select
seg_out<= not "00111111" when "00000000",
          not "00000110" when "00000001",
          not "01011011" when "00000010",
          not "01001111" when "00000011",
          not "01100110" when "00000100",
          not "01101101" when "00000101",
          not "01111101" when "00000110",
          not "00000111" when "00000111",
          not "01111111" when "00001000",
          not "01101111" when "00001001",
          "10001000" when  "01100100", -- A
          "10000011" when "01100101", -- b
          "11000110" when "01100110", -- C
          "10100001" when "01100111", -- d
--          "10001101" when "01101000", -- E
--          "011000" when "01101000", -- E
          "10000110" when "01101000", -- E
          not "01111001" when others;

end Behavioral;