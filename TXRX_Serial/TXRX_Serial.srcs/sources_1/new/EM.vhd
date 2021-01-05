----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.01.2021 15:01:35
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity EM is
    Port ( data_strobe : in std_logic;
           apagarled : in std_logic;
           enviarDatoPrueba: in STD_LOGIC;
           sendDemoData: out STD_LOGIC;
           dataToSend: out STD_LOGIC_VECTOR ( 7 downto 0);
           led : out STD_LOGIC;
           clk16: in STD_LOGIC);
end EM;

architecture Behavioral of EM is

type STATE is (ENCENDIDO, APAGADO, SENDPRUEBA);
signal ACTUALSTATE, NEXTSTATE : STATE;
signal data: STD_LOGIC_VECTOR (7 downto 0):= "01000001";

begin

SEQ: process(clk16)
begin
    if clk16'event and clk16 = '1' then
        ACTUALSTATE <= NEXTSTATE;
    end if;
end process SEQ;

COMB: process (data_strobe, clk16, apagarled, enviarDatoPrueba)
begin

case ACTUALSTATE is

    when APAGADO =>
        led <= '0';
        
        if enviarDatoPrueba = '1' then
            NEXTSTATE<=SENDPRUEBA;
        elsif data_strobe = '1' then
            NEXTSTATE<=ENCENDIDO;
        else
            NEXTSTATE<=ACTUALSTATE;
        end if;
        
     when ENCENDIDO =>
        led <= '1';
        if enviarDatoPrueba = '1' then
            NEXTSTATE<=SENDPRUEBA;
        elsif apagarled = '1' then
            NEXTSTATE<=APAGADO;
        else
            NEXTSTATE<=ENCENDIDO;
        end if;
        
     when SENDPRUEBA =>
        dataToSend <= data;
        sendDemoData <= '1';
        NEXTSTATE<=APAGADO;
        dataToSend <= "";
        
        
end case;
end process;

end Behavioral;
