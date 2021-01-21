----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.01.2021 14:05:05
-- Design Name: 
-- Module Name: Data_memoria - Behavioral
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

entity Data_memoria is
      Port ( clk : in STD_LOGIC;
             reset : in STD_LOGIC;
             data_in : in STD_LOGIC_VECTOR (7 downto 0);
             data_receive : in STD_LOGIC;
             a_pmw_complete : in STD_LOGIC;
             b_pmw_complete : in STD_LOGIC;
             c_pmw_complete : in STD_LOGIC;
             d_pmw_complete : in STD_LOGIC;
             e_pmw_complete : in STD_LOGIC;
             angle_out : out STD_LOGIC_VECTOR (7 downto 0);
             id_out : out STD_LOGIC_VECTOR (7 downto 0));
             --send : out STD_LOGIC);
end Data_memoria;

architecture Behavioral of Data_memoria is

type egoera is (id_received, angle_received, idle, send_data);
signal oraingoa, hurrengoa: egoera;

signal angle, id : STD_LOGIC_VECTOR (7 downto 0);

begin

SEQ: process (clk, reset)
begin
--if reset = '1' then
--    oraingoa <= idle;
if clk'event and clk='1' then
    oraingoa<=hurrengoa;
end if;
end process;

COMB: process (oraingoa,clk)

begin
    case oraingoa is
        when idle =>
            if data_receive = '1' then
                hurrengoa <= id_received;
            else
                hurrengoa <= idle;
            end if;
            
         when id_received =>
            if data_receive = '1' then
                 hurrengoa <= angle_received;
             else
                 hurrengoa <= id_received;
             end if;
             
          when angle_received =>
             if data_receive = '1' then
                  hurrengoa <= send_data;
              else
                  hurrengoa <= angle_received;
              end if;
              
          when send_data => 
              hurrengoa <= idle;
              if a_pmw_complete='1' or b_pmw_complete='1' or c_pmw_complete='1' or d_pmw_complete='1' or e_pmw_complete='1' then
                    hurrengoa <= idle;
              else
                    hurrengoa <= send_data;
              end if;
    end case;

end process;


SEQ2: process (clk)
begin

if clk'event and clk='1' then
    if oraingoa = id_received then
        id <= data_in;
    elsif oraingoa = angle_received then
        angle <= data_in;
    elsif oraingoa = send_data then
        id_out <= id;
        angle_out <= angle;
    end if;
end if;
end process;

end Behavioral;

