----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.01.2021 14:20:56
-- Design Name: 
-- Module Name: nagusia_display_tb - Behavioral
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

entity nagusia_display_tb is
--  Port ( );
end nagusia_display_tb;

architecture Behavioral of nagusia_display_tb is

component nagusia_display
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           id : in STD_LOGIC_VECTOR (7 downto 0);
           grado : in STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (7 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal clk: std_logic;
signal rst: std_logic;
signal id, grado: std_logic_vector(7 downto 0);
signal anodo: STD_LOGIC_VECTOR (3 downto 0);
signal katodo: STD_LOGIC_VECTOR (7 downto 0);
begin

dut: nagusia_display port map
(clk=>clk,
rst=>rst,
id => id,
grado => grado,
an=>anodo,
seg=>katodo
);

clk_proc: process
begin
clk<='1';
wait for 5 ns;
clk<='0';
wait for 5 ns;
end process;

stim_proc: process
begin
rst<='1';
id <= not "01111001";
grado <= not "01111001";
wait for 10 ns;
rst<='0';
id <= "01100101";
grado <= "00110110";
wait for 5000 ns;
id <= "01100100";
grado <= "00110010";
wait for 5000 ns;
id <= "01100110";
grado <= "00000110";
wait;

end process;

end Behavioral;
