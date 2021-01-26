----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.01.2021 14:52:44
-- Design Name: 
-- Module Name: data_memoria_tb - Behavioral
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

entity data_memoria_tb is
--  Port ( );
end data_memoria_tb;

architecture Behavioral of data_memoria_tb is

component Data_memoria
      Port ( clk : in STD_LOGIC;
             ena : in STD_LOGIC;
             reset : in STD_LOGIC;
             data_in : in STD_LOGIC_VECTOR (7 downto 0);
             data_receive : in STD_LOGIC;
             led_send : out STD_LOGIC;
             led_angle : out STD_LOGIC;
             led_id : out STD_LOGIC;
             led_idle : out STD_LOGIC;
             led_off : out STD_LOGIC;
             angle_out : out STD_LOGIC_VECTOR (7 downto 0);
             id_out : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal clk,ena,reset,data_receive: std_logic;
signal led_send,led_angle,led_id,led_idle,led_off: std_logic;
siganl data_in, angle_out,id_out: std_logic_vector(7 downto 0);

begin

dut: Data_memoria port map ( clk =>clk,
                             ena => ena,
                             reset => reset,
                             data_in => data_in,
                             data_receive => data_receive,
                             led_send => led_send,
                             led_angle => led_angle,
                             led_id => led_id,
                             led_idle => led_idle,
                             led_off => led_off,
                             angle_out => angle_out,
                             id_out => id_out);
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
wait for 10 ns;
rst<='0';

wait for 5000 ns;

wait for 5000 ns;

wait;

end process;

end Behavioral;
