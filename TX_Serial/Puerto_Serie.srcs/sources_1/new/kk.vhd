----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2020 17:56:18
-- Design Name: 
-- Module Name: frekuentzi_zatitzailea - Behavioral
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

entity frekuentzi_zatitzailea is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end frekuentzi_zatitzailea;

architecture Behavioral of frekuentzi_zatitzailea is

signal kont : STD_LOGIC_VECTOR (16 downto 0);
begin

SEQ: process (clk, rst)
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2020 17:56:18
-- Design Name: 
-- Module Name: frekuentzi_zatitzailea - Behavioral
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

entity frekuentzi_zatitzailea2 is
    Port ( clk : in STD_LOGIC;
           en_16_x_baud : out STD_LOGIC);
end frekuentzi_zatitzailea2;

architecture Behavioral of frekuentzi_zatitzailea2 is

signal baud_count : integer range 0 to 64 :=0;
signal clk_16_x : std_logic;

begin

baud_timer: process (clk)
begin
    if clk'event and clk = '1' then 
         if baud_count = 64 then
             baud_count <= 0;
             clk_16_x <= '1';
       else
              baud_count <= baud_count + 1;
              clk_16_x <= '0';
       end if;
    end if;
end process baud_timer;

en_16_x_baud <= clk_16_x;

end Behavioral;
