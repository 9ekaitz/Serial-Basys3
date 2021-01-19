----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.01.2021 17:43:08
-- Design Name: 
-- Module Name: data_memory - Behavioral
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

entity data_memory is
     Port ( data_split : in STD_LOGIC_VECTOR (7 downto 0);
            data_split_strobe : in STD_LOGIC;
            send : out STD_LOGIC;
            data : out STD_LOGIC_VECTOR (31 downto 0));
end data_memory;

architecture Behavioral of data_memory is

signal data_s : STD_LOGIC_VECTOR (31 downto 0);

DATA: process (clk)
begin

end process;

end Behavioral;
