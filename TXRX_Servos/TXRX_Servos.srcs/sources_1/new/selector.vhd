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
            reset : in STD_LOGIC;
            id : in STD_LOGIC_VECTOR (7 downto 0);
            angle : in STD_LOGIC_VECTOR (7 downto 0);
            angle_a : out STD_LOGIC_VECTOR (7 downto 0); 
            angle_b : out STD_LOGIC_VECTOR (7 downto 0); 
            angle_c : out STD_LOGIC_VECTOR (7 downto 0); 
            angle_d : out STD_LOGIC_VECTOR (7 downto 0);             
            angle_e : out STD_LOGIC_VECTOR (7 downto 0);
            angle_f : out STD_LOGIC_VECTOR (7 downto 0); 
            angle_g : out STD_LOGIC_VECTOR (7 downto 0); 
            angle_h : out STD_LOGIC_VECTOR (7 downto 0); 
            angle_i : out STD_LOGIC_VECTOR (7 downto 0);             
            angle_j : out STD_LOGIC_VECTOR (7 downto 0));
end selector;

architecture Behavioral of selector is

begin

SELECTOR: process (clk, reset)
begin
if reset = '1' then
    angle_a <= "00000000";
    angle_b <= "00000000";
    angle_c <= "00000000";
    angle_d <= "00000000";
    angle_e <= "00000000";
    angle_f <= "00000000";
    angle_g <= "00000000";
    angle_h <= "00000000";
    angle_i <= "00000000";
    angle_j <= "00000000";
    
elsif clk'event and clk='1' then
    case id is
        when "01100100" => 
            angle_a <= angle;
            
        when "01100101" =>
            angle_b <= angle;
            
        when "01100110" =>
            angle_c <= angle;
            
        when "01100111" =>
            angle_d <= angle;
            
        when "01101000" =>
            angle_e <= angle;
           
        when "01101001" => ----------------------------
            angle_f <= angle;
            
        when "01101010" =>
            angle_g <= angle;
            
        when "01101011" =>
            angle_h <= angle;
            
        when "01101100" =>
            angle_i <= angle;
            
        when "01101101" =>
            angle_j <= angle;
            
        when others => -- Si no se pone when others da error
            
    end case;
end if;
end process;

end Behavioral;
