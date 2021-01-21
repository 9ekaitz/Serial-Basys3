----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.01.2021 14:31:38
-- Design Name: 
-- Module Name: selector - Behavioral
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

entity selector is
     Port ( clk : in STD_LOGIC;
            id : in STD_LOGIC_VECTOR (7 downto 0);
            angle : in STD_LOGIC_VECTOR (7 downto 0);
            angle_a : out STD_LOGIC_VECTOR (7 downto 0); 
            angle_b : out STD_LOGIC_VECTOR (7 downto 0); 
            angle_c : out STD_LOGIC_VECTOR (7 downto 0); 
            angle_d : out STD_LOGIC_VECTOR (7 downto 0);             
            angle_e : out STD_LOGIC_VECTOR (7 downto 0)             
            );
end selector;

architecture Behavioral of selector is

begin

SELECTOR: process (clk)
begin
    case id is
        when "00000001" => 
            angle_a <= angle;
            
        when "00000010" =>
            angle_b <= angle;
            
        when "00000011" =>
            angle_c <= angle;
            
        when "00000100" =>
            angle_d <= angle;
            
        when "00000101" =>
            angle_e <= angle;
            
        when others =>
            
    end case;
end process;

end Behavioral;
