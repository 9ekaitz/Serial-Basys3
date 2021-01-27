----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.01.2021 15:03:35
-- Design Name: 
-- Module Name: selector_tb - Behavioral
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

entity selector_tb is
--  Port ( );
end selector_tb;

architecture Behavioral of selector_tb is

component selector is
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
end component;

signal clk, reset: std_logic;
signal id, angle, angle_a, angle_b, angle_c, angle_d, angle_e, angle_f, angle_g, angle_h, angle_i, angle_j: std_logic_vector(7 downto 0);

begin

dut: selector port map ( clk => clk,
                         reset => reset,
                         id => id,
                         angle => angle,
                         angle_a => angle_a,
                         angle_b => angle_b,
                         angle_c => angle_c,
                         angle_d => angle_d,      
                         angle_e => angle_e,
                         angle_f => angle_f,
                         angle_g => angle_g,
                         angle_h => angle_h,
                         angle_i => angle_i,        
                         angle_j => angle_j);

clk_proc: process
begin
clk<='1';
wait for 5 ns;
clk<='0';
wait for 5 ns;
end process;

stim_proc: process
begin
reset<='1';
wait for 10 ns;
reset<='0';
id <= "01100100";
angle <= "00010000";
wait for 5000 ns;
id <= "01100110";
angle <= "00011100";
wait;

end process;

end Behavioral;
