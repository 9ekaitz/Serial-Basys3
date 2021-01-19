----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.12.2020 21:21:36
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
    Port (      
                 clk : in std_logic; 
                 serial_in : in std_logic;
                 serial_out: out std_logic;  
                 imp: out STD_LOGIC_VECTOR (5 downto 0);
                
                 an : out STD_LOGIC_VECTOR (3 downto 0);
                 seg : out STD_LOGIC_VECTOR (6 downto 0)
                 );
end top;

architecture Behavioral of top is

component FrekuentziaZatitzailea is
    Port ( clk : in STD_LOGIC;
           en_16_x_baud : out STD_LOGIC
           );
end component;

component kcuart_rx is--recibe
    Port (  serial_in : in std_logic;  
            data_out : out std_logic_vector(7 downto 0);
            data_strobe : out std_logic;
            en_16_x_baud : in std_logic;
            clk : in std_logic);
end component;

component kcuart_tx is --manda
    Port (        data_in : in std_logic_vector(7 downto 0);
           send_character : in std_logic;
             en_16_x_baud : in std_logic;
               serial_out : out std_logic;
              Tx_complete : out std_logic;
                      clk : in std_logic);
    end component;
    
component EM is
    Port ( clk: in STD_LOGIC;
           data_strobe : in STD_LOGIC;          
           send_character: out STD_LOGIC;      
           datain: in STD_LOGIC_VECTOR (7 downto 0);
           data_out: out STD_LOGIC_VECTOR (7 downto 0)
);
end component;





component Memoria is
    Port ( clk:  in STD_LOGIC;
           tx_complete: in STD_LOGIC;
           data_strobe : in STD_LOGIC;
           botonout : out STD_LOGIC);
end component;

component display7 is
    Port (
               signal_in : in STD_LOGIC_VECTOR (7 downto 0);
               an_out : out STD_LOGIC_VECTOR (3 downto 0);
               seg_out : out STD_LOGIC_VECTOR (6 downto 0)
           );
end component;



signal data: STD_LOGIC_VECTOR (7 downto 0);
signal clk_16_x: STD_LOGIC;
signal send_character:STD_LOGIC;

signal data_strobe: STD_LOGIC;
signal Tx_complete: STD_LOGIC;
signal s_memoria:STD_LOGIC;
signal send:STD_LOGIC;


signal data_out:std_logic_vector(7 downto 0);

signal out_boton,s_emaitza:STD_LOGIC;
--signal out_boton:STD_LOGIC;

signal s_uno,s_dos,s_tres,s_cuatro: STD_LOGIC_VECTOR (7 downto 0);

begin

imp <= "ZZZZZZ";

U1: FrekuentziaZatitzailea port map(
            clk=>clk,
            en_16_x_baud=>clk_16_x
            );
            
U2: kcuart_rx port map(
            serial_in=>serial_in,
            data_out=>data,
            data_strobe=>data_strobe,
            en_16_x_baud=>clk_16_x,
            clk=>clk);
            

U3: display7 port map(
           signal_in=>data_out,
           an_out=>an,
           seg_out=>seg);
           
U4: EM port map(
           clk =>clk,
           data_strobe=>s_memoria,          
           send_character=>send_character,      
           datain=>data,
           data_out=>data_out
           );
           
U5: kcuart_tx port map(
            data_in =>data_out,
            send_character => send_character,
            en_16_x_baud =>clk_16_x,
            serial_out =>serial_out,
            Tx_complete =>Tx_complete,
            clk =>clk);


U8: Memoria port map(
           clk=>clk,
           tx_complete=>Tx_complete,
           data_strobe=>data_strobe,
           botonout=>s_memoria
        
           );


end Behavioral;
