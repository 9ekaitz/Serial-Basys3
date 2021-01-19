----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2021 18:05:47
-- Design Name: 
-- Module Name: Memoria - Behavioral
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

entity comparador is
    Port ( clk:  in STD_LOGIC;
           memoriain : in STD_LOGIC;
           botoi : in STD_LOGIC;
           botonout : out STD_LOGIC);
end comparador;

architecture Behavioral of comparador is

begin
comparador: process (clk)
begin


--if clk'event and clk='1' then
    if botoi='1' and memoriain='1' then
       botonout <= '1';
    else
        botonout <= '0';

     end if;
 -- end if;  
    
  end process;
  
end Behavioral;