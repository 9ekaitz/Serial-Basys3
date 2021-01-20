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

entity FrekuentziaZatitzailea is
    Port ( clk : in STD_LOGIC;
           clk_pmw : out STD_LOGIC;
           en_16_x_baud : out STD_LOGIC;
           clk_refresh : out STD_LOGIC);
end FrekuentziaZatitzailea;

architecture Behavioral of FrekuentziaZatitzailea is

signal baud_count : integer range 0 to 651 :=0;
signal pmw_count : integer;
signal refresh_count : integer;
signal cont: integer ;
signal clk_16_x : STD_LOGIC;
signal clk_pmw_s : STD_LOGIC;
signal clk_refresh_s : STD_LOGIC;

begin

baud_timer: process (clk)
begin
    if clk'event and clk = '1' then 
        if baud_count = 651 then -- 10^8 / (16 * 9600) = 54 cycles
             baud_count <= 0;
             clk_16_x <= '1';
        else
             baud_count <= baud_count + 1;
             clk_16_x <= '0';
        end if;
       
       if pmw_count > 49 then
            pmw_count <= 0;
            clk_pmw_s <= not clk_pmw_s;
       else
            pmw_count <= pmw_count + 1;
       end if;
       
       if refresh_count > 50000 then
            refresh_count <= 0;
            clk_refresh_s <= not clk_refresh_s;
        else
            refresh_count <= refresh_count + 1;
        end if;
            
    end if;
    
end process baud_timer;

en_16_x_baud <= clk_16_x;
clk_pmw <= clk_pmw_s;
clk_refresh <= clk_refresh_s;

end Behavioral;