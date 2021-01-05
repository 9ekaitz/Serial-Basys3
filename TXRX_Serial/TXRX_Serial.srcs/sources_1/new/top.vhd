----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.01.2021 14:23:25
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
      Port ( serial_in : in STD_LOGIC;
             serial_out: out STD_LOGIC;
             apagarled : in std_logic;
             enviarDatoPrueba: in STD_LOGIC;
             led : out STD_LOGIC;
             finishProcess: out STD_LOGIC;
             imp: out STD_LOGIC_VECTOR (5 downto 0);
             clk : in STD_LOGIC);
end top;

architecture Behavioral of top is

component EM is
    Port ( data_strobe : in std_logic;
           apagarled : in std_logic;
           enviarDatoPrueba: in STD_LOGIC;
           sendDemoData: out STD_LOGIC;
           dataToSend: out STD_LOGIC_VECTOR ( 7 downto 0);
           led : out STD_LOGIC;
           clk16: in STD_LOGIC);
end component;

component kcuart_tx is
    Port (        data_in : in std_logic_vector(7 downto 0);
           send_character : in std_logic;
             en_16_x_baud : in std_logic;
               serial_out : out std_logic;
              Tx_complete : out std_logic;
                      clk : in std_logic);
end component;

component kcuart_rx is
    Port (            serial_in : in std_logic;  
                 data_out : out std_logic_vector(7 downto 0);
              data_strobe : out std_logic;
             en_16_x_baud : in std_logic;
                      clk : in std_logic);
end component;

component FrekuentziaZatitzailea is
    Port ( clk : in STD_LOGIC;
           en_16_x_baud : out STD_LOGIC);
end component;

signal data: STD_LOGIC_VECTOR (7 downto 0);
signal dataFAKE: STD_LOGIC_VECTOR (7 downto 0);
signal sendData: STD_LOGIC;
signal sendDataFAKE: STD_LOGIC;
signal clk16_x: STD_LOGIC;

begin

imp <= "ZZZZZZ";

U1: FrekuentziaZatitzailea port map (clk => clk, en_16_x_baud => clk16_x);

U2: kcuart_rx port map ( serial_in => serial_in,
                         en_16_x_baud => clk16_x,
                         clk => clk,
                         data_out => dataFAKE,
                         data_strobe => sendDataFAKE);
                         
U3: kcuart_tx port map ( data_in => data,
                         send_character => sendData,
                         en_16_x_baud => clk16_x,
                         serial_out => serial_out,
                         Tx_complete => finishProcess,
                         clk => clk);
                         
U4: EM port map (       data_strobe => sendData,
                        apagarled=>apagarled,
                        enviarDatoPrueba=>enviarDatoPrueba,
                        sendDemoData => sendData,
                        dataToSend => data,
                        led => led,
                        clk16 => clk16_x);

end Behavioral;
