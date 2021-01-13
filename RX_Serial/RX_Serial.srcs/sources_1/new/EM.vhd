----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.01.2021 16:51:24
-- Design Name: 
-- Module Name: EM - Behavioral
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

entity EM is
    Port ( clk: in STD_LOGIC;
           data_strobe : in STD_LOGIC;
           rst: in STD_LOGIC;
           botoi: in STD_LOGIC;
           luz2: out STD_LOGIC;
           luz : out STD_LOGIC
            );
end EM;

architecture Behavioral of EM is
--signal kont : std_logic_vector(26 downto 0);
signal kont : integer range 0 to 651 :=0; --80

type egoera is (apagado,jasota);
signal oraingoa, hurrengoa: egoera;



begin

SEQ: process (clk,rst)
begin
if rst='1' then
    oraingoa<=apagado;
    --oraingoa<=oraingoa;
elsif clk'event and clk='1' then
    oraingoa<=hurrengoa;
end if;
end process;

COMB: process (oraingoa,clk)

begin
    case oraingoa is
        when apagado=> 
         --luz<='0';
            if data_strobe='1' then
            hurrengoa<=jasota;
            end if;
            
            if rst='1' then 
               -- luz<='0';
                --luz2<='1';
                end if;
        when jasota=>
             hurrengoa<=apagado;
        
    end case;

end process;

memoria: process (clk,rst)
begin
if clk'event and clk='1' then
    if oraingoa=jasota then
        luz<='1';
    elsif botoi='1' then
        luz<='0';
    else
        luz2<='1';
    
    
    
    
--        if kont=100000000 then 
--            luz<='0';
--            luz2<='1';
--          --  kont<=(others=>'0');
--                hurrengoa<=apagado; 
--        else
--        luz<='1';
--        luz2<='0';

--        kont<=kont+1;
--        end if;
        
    end if;

end if;
      
         
end process;

end Behavioral;
