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
           --send : out STD_LOGIC;      
           datain: in STD_LOGIC_VECTOR (7 downto 0);
           data_out: out STD_LOGIC_VECTOR (7 downto 0)
            );
end EM;

architecture Behavioral of EM is
signal kont : integer range 0 to 651 :=0; --80
signal s_data: STD_LOGIC_VECTOR (7 downto 0);

type egoera is (itzalita,jasota,bidali);
signal oraingoa, hurrengoa: egoera;



begin

SEQ: process (clk)
begin

if clk'event and clk='1' then
    oraingoa<=hurrengoa;
end if;

end process;

COMB: process (oraingoa,clk)

begin
    case oraingoa is
        when itzalita=> 
        
           --send<='0';

             if data_strobe='1'   then
                     hurrengoa<=jasota;
              else
              hurrengoa<=itzalita;
             end if;
            
            
        when jasota=> 
           --send<='0';
           s_data<=datain;
           hurrengoa<=bidali;
             
        when bidali=>
              
              --send<='1';
              data_out<=s_data;
              if data_strobe<='0' then
                 hurrengoa<=itzalita;
                 else
                 hurrengoa<=bidali;
                  end if;
    end case;
        
end process;

end Behavioral;