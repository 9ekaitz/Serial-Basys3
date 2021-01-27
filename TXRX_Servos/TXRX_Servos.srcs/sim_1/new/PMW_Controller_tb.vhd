----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.01.2021 15:10:43
-- Design Name: 
-- Module Name: PMW_Controller_tb - Behavioral
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

entity PMW_Controller_tb is
--  Port ( );
end PMW_Controller_tb;

architecture Behavioral of PMW_Controller_tb is

component PWM_controller
    Port ( clk : in STD_LOGIC;
           clk_pmw : in STD_LOGIC;
           angle_byte : in STD_LOGIC_VECTOR (7 downto 0);
           pmw : out STD_LOGIC);
end component;

signal clk, clk_pmw: std_logic;
signal angle_byte: std_logic_vector(7 downto 0);
signal pmw: std_logic;

begin

dut: PWM_controller port map( clk => clk,
                              clk_pmw => clk_pmw,
                              angle_byte => angle_byte,
                              pmw => pmw);
                             
clk_proc: process
begin
clk<='1';
wait for 5 ns;
clk<='0';
wait for 5 ns;
end process;

clk_proc: process
begin
clk_pmw<='1';
wait for 1000 ns;
clk_pmw<='0';
wait for 1000 ns;
end process;

stim_proc: process
begin
rst<='1';
wait for 10 ns;
rst<='0';
angle_byte <= "00010010";
wait for 5000 ns;
angle_byte <= "0001010";
wait for 5000 ns;
angle_byte <= "00011010";
wait;

end process;              
                              

end Behavioral;
