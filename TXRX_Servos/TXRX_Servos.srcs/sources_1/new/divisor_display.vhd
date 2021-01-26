----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.01.2021 13:39:20
-- Design Name: 
-- Module Name: divisor_display - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divisor_display is
    Port ( clk : in STD_LOGIC;
           zenb : in STD_LOGIC_VECTOR (7 downto 0);
           bateko : out STD_LOGIC_VECTOR (7 downto 0);
           hamarreko : out STD_LOGIC_VECTOR (7 downto 0));
end divisor_display;

architecture Behavioral of divisor_display is

signal  zenb_int, int_hamarreko, int_ehuneko, int_bateko: integer;

begin

zenb_int <= conv_integer(unsigned(zenb));                      
int_hamarreko <= zenb_int / 10;                                                                  
int_bateko <= zenb_int - (int_hamarreko*10);

with int_bateko select
bateko<="00000000" when 0,
        "00000001" when 1,
        "00000010" when 2,
        "00000011" when 3,
        "00000100" when 4,
        "00000101" when 5,
        "00000110" when 6,
        "00000111" when 7,
        "00001000" when 8,
        "00001001" when 9,
        "00000000" when others;

with int_hamarreko select
hamarreko<="00000000" when 0,
           "00000001" when 1,
           "00000010" when 2,
           "00000011" when 3,
           "00000100" when 4,
           "00000101" when 5,
           "00000110" when 6,
           "00000111" when 7,
           "00001000" when 8,
           "00001001" when 9,
           "00000000" when others;

end Behavioral;
