----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2021 16:17:31
-- Design Name: 
-- Module Name: para_mandar - Behavioral
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

entity para_mandar is
    Port (  clk: in STD_LOGIC;
               botoi: in STD_LOGIC;
          datua_out: out STD_LOGIC_VECTOR (7 downto 0);
          o_uno: in STD_LOGIC_VECTOR (7 downto 0);
          o_dos: in STD_LOGIC_VECTOR (7 downto 0);
          o_tres: in STD_LOGIC_VECTOR (7 downto 0);
          o_cuatro: in STD_LOGIC_VECTOR (7 downto 0)
          );
end para_mandar;

architecture Behavioral of para_mandar is

signal kontadorea : integer range 0 to 5 :=0; 

begin

memoria: process (clk)
begin
if clk'event and clk='1' then
    
    if botoi='1'then
    kontadorea<=kontadorea+1;
    
    if kontadorea=0 then
        datua_out<=o_uno;
    elsif kontadorea=1 then
        datua_out<=o_dos;
    elsif kontadorea=2 then
        datua_out<=o_tres;
    elsif kontadorea=3 then
        datua_out<=o_cuatro;
    end if;
    
    
    end if;
 end if;   
end process;

end Behavioral;
