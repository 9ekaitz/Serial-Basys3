----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.01.2021 13:43:28
-- Design Name: 
-- Module Name: EM_display - Behavioral
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

entity EM_display is
        Port (
               clk : in STD_LOGIC;
               zenb_bateko : in STD_LOGIC_VECTOR (7 downto 0);
               zenb_hamarreko : in STD_LOGIC_VECTOR (7 downto 0);
               zenb_id: in STD_LOGIC_VECTOR (7 downto 0);
               anodo : out STD_LOGIC_VECTOR (3 downto 0);
               katodo : out STD_LOGIC_VECTOR (7 downto 0));
end EM_display;

architecture Behavioral of EM_display is
    
type egoera is (bateko, hamarreko, ehuneko, id);
signal oraingoa, hurrengoa: egoera;

begin
SEQ: process (clk)
begin
if clk'event and clk='1' then
    oraingoa<=hurrengoa;
end if;
end process;

COMB: process (oraingoa)
begin
    case oraingoa is
    when bateko=>
        anodo<="1110";
        katodo<=zenb_bateko;
        hurrengoa<=hamarreko;
    when hamarreko=>
        anodo<="1101";
        katodo<=zenb_hamarreko;
        hurrengoa<=ehuneko;
    when ehuneko=>
         anodo<="1011";
         katodo<= not "01000000";
         hurrengoa<=id;
    when id=>
         anodo<="0111";
         katodo<=zenb_id;
         hurrengoa<=bateko;
    end case;
end process;


end Behavioral;
