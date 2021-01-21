----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.01.2021 17:56:19
-- Design Name: 
-- Module Name: duplicator - Behavioral
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

entity duplicator is
     Port ( pmw_signal : in STD_LOGIC;
            a : out STD_LOGIC;
            b : out STD_LOGIC;
            c : out STD_LOGIC;
            d : out STD_LOGIC;
            e : out STD_LOGIC
               );
end duplicator;

architecture Behavioral of duplicator is

begin

a <= pmw_signal;
b <= pmw_signal;
c <= pmw_signal;
d <= pmw_signal;
e <= pmw_signal;

end Behavioral;
