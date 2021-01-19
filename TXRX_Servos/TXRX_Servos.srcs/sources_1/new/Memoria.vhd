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

entity Memoria is
    Port ( clk:  in STD_LOGIC;
           pmw_complete: in STD_LOGIC;
           data_strobe : in STD_LOGIC;
           data_strobe_m : out STD_LOGIC);
end Memoria;

architecture Behavioral of Memoria is

signal s_memoria : std_logic;

begin
memoria: process (clk)
begin


if clk'event and clk='1' then

    if data_strobe='1' then
        s_memoria <= data_strobe;
    elsif pmw_complete='1' then
        s_memoria <= data_strobe;
    else
        s_memoria <= s_memoria;
    end if;
   
  end if;
  
  data_strobe_m <= s_memoria;   
  end process;
 
end Behavioral;
