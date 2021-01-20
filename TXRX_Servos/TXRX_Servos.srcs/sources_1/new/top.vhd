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
    Port (       clk : in std_logic; 
                 serial_in : in std_logic;
                 serial_out: out std_logic;
                 serial_pmw_port : out STD_LOGIC;
                 imp: out STD_LOGIC_VECTOR (5 downto 0);               
                 an : out STD_LOGIC_VECTOR (3 downto 0);
                 seg : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is

component FrekuentziaZatitzailea is
    Port ( clk : in STD_LOGIC;
           clk_pmw : out STD_LOGIC;
           en_16_x_baud : out STD_LOGIC;
           clk_refresh : out STD_LOGIC);
end component;

component kcuart_rx is
    Port (  serial_in : in std_logic;  
            data_out : out std_logic_vector(7 downto 0);
            data_strobe : out std_logic;
            en_16_x_baud : in std_logic;
            clk : in std_logic);
end component;
    
component EM is
    Port ( clk: in STD_LOGIC;
           data_strobe : in STD_LOGIC;          
           send_character: out STD_LOGIC;      
           datain: in STD_LOGIC_VECTOR (7 downto 0);
           data_out: out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Memoria is
    Port ( clk:  in STD_LOGIC;
           pmw_complete: in STD_LOGIC;
           data_strobe : in STD_LOGIC;
           data_strobe_m : out STD_LOGIC);
end component;

component display7 is
    Port ( signal_in : in STD_LOGIC_VECTOR (7 downto 0);
           seg_out : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component PWM_controller is
    Port ( clk : in STD_LOGIC;
           angle_byte : in STD_LOGIC_VECTOR (7 downto 0);
           pmw_complete : out STD_LOGIC;
           pmw : out STD_LOGIC);
end component;

component EM_display is
        Port (
               clk : in STD_LOGIC;
               zenb_bateko : in STD_LOGIC_VECTOR (7 downto 0);
               zenb_hamarreko : in STD_LOGIC_VECTOR (7 downto 0);
               zenb_ehuneko: in STD_LOGIC_VECTOR (7 downto 0);
               anodo : out STD_LOGIC_VECTOR (3 downto 0);
               katodo : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component divisor_display is
    Port ( zenb : in STD_LOGIC_VECTOR (7 downto 0);
           bateko : out STD_LOGIC_VECTOR (7 downto 0);
           hamarreko : out STD_LOGIC_VECTOR (7 downto 0);
           ehuneko: out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal data: STD_LOGIC_VECTOR (7 downto 0);
signal clk_16_x: STD_LOGIC;
signal clk_pmw : STD_LOGIC;
--signal send_character : STD_LOGIC;
signal data_strobe: STD_LOGIC;
signal pmw_complete : STD_LOGIC;
signal send : STD_LOGIC;
signal data_out:std_logic_vector(7 downto 0);
signal out_boton,s_emaitza:STD_LOGIC;

signal clk_refresh : STD_LOGIC;
signal data_bateko, data_hamarreko, data_ehuneko : STD_LOGIC_VECTOR (7 downto 0);
signal zenb_bateko, zenb_hamarreko, zenb_ehuneko : STD_LOGIC_VECTOR (7 downto 0);



signal s_uno,s_dos,s_tres,s_cuatro: STD_LOGIC_VECTOR (7 downto 0);

begin

imp <= "ZZZZZZ";

U1: FrekuentziaZatitzailea port map(
            clk=>clk,
            clk_pmw=>clk_pmw,
            en_16_x_baud=>clk_16_x,
            clk_refresh=>clk_refresh);
            
U2: kcuart_rx port map(
            serial_in=>serial_in,
            data_out=>data,
            data_strobe=>data_strobe,
            en_16_x_baud=>clk_16_x,
            clk=>clk);
           
U3: EM port map(
           clk =>clk,
           data_strobe=>send,                
           datain=>data,
           data_out=>data_out
           );
           
U6: Memoria port map(
           clk=>clk,
           pmw_complete=>pmw_complete,
           data_strobe=>data_strobe,
           data_strobe_m=>send);

U7: PWM_controller port map ( clk => clk_pmw,
                              angle_byte => data_out,
                              pmw_complete => pmw_complete,
                              pmw => serial_pmw_port);
                              
U8: divisor_display port map ( zenb => data_out,
                               bateko => data_bateko,
                               hamarreko => data_hamarreko,
                               ehuneko => data_ehuneko);
                           
U9: display7 port map ( signal_in => data_bateko,
                        seg_out => zenb_bateko);
                        
U10: display7 port map ( signal_in => data_hamarreko,
                        seg_out => zenb_hamarreko);
                        
U11: display7 port map ( signal_in => data_ehuneko,
                         seg_out => zenb_ehuneko);
                         
U12: EM_display port map ( clk => clk_refresh,
                           zenb_bateko => zenb_bateko,
                           zenb_hamarreko => zenb_hamarreko,
                           zenb_ehuneko => zenb_ehuneko,
                           anodo => an,
                           katodo => seg);

end Behavioral;
