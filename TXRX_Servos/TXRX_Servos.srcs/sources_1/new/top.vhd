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
                 reset : in STD_LOGIC;
                 serial_in : in std_logic;
--                 serial_out: out std_logic;
                 a_pmw_port : out STD_LOGIC;
                 b_pmw_port : out STD_LOGIC;
                 c_pmw_port : out STD_LOGIC;
                 d_pmw_port : out STD_LOGIC;
                 e_pmw_port : out STD_LOGIC;
                 f_pmw_port : out STD_LOGIC;
                 g_pmw_port : out STD_LOGIC;
                 h_pmw_port : out STD_LOGIC;
                 i_pmw_port : out STD_LOGIC;
                 j_pmw_port : out STD_LOGIC;
                 led_send : out STD_LOGIC;
                 led_angle : out STD_LOGIC;
                 led_id : out STD_LOGIC;
                 led_idle : out STD_LOGIC;
                 led_off : out STD_LOGIC;
                 start: in STD_LOGIC;
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

component PWM_controller is
    Port ( clk : in STD_LOGIC;
           clk_pmw : in STD_LOGIC;
           angle_byte : in STD_LOGIC_VECTOR (7 downto 0);
           pmw : out STD_LOGIC);
end component;

component Data_memoria is
    Port ( clk : in STD_LOGIC;
           ena : in STD_LOGIC;
           reset : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_receive : in STD_LOGIC;
           led_send : out STD_LOGIC;
           led_angle : out STD_LOGIC;
           led_id : out STD_LOGIC;
           led_idle : out STD_LOGIC;
           led_off : out STD_LOGIC;
           angle_out : out STD_LOGIC_VECTOR (7 downto 0);
           id_out : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component selector is
     Port ( clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            id : in STD_LOGIC_VECTOR (7 downto 0);
            angle : in STD_LOGIC_VECTOR (7 downto 0);
            angle_a : out STD_LOGIC_VECTOR (7 downto 0); 
            angle_b : out STD_LOGIC_VECTOR (7 downto 0); 
            angle_c : out STD_LOGIC_VECTOR (7 downto 0); 
            angle_d : out STD_LOGIC_VECTOR (7 downto 0);             
            angle_e : out STD_LOGIC_VECTOR (7 downto 0);
            angle_f : out STD_LOGIC_VECTOR (7 downto 0); 
            angle_g : out STD_LOGIC_VECTOR (7 downto 0); 
            angle_h : out STD_LOGIC_VECTOR (7 downto 0); 
            angle_i : out STD_LOGIC_VECTOR (7 downto 0);             
            angle_j : out STD_LOGIC_VECTOR (7 downto 0));
end component;


component nagusia_display
    Port ( clk : in STD_LOGIC;
           id : in STD_LOGIC_VECTOR (7 downto 0);
           grado : in STD_LOGIC_VECTOR (7 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (7 downto 0));
end component;
-- Byte recivido
signal data: STD_LOGIC_VECTOR (7 downto 0);

-- Clocks
signal clk_16_x: STD_LOGIC;
signal clk_pmw : STD_LOGIC;
signal clk_refresh : STD_LOGIC;

-- Booleanos
signal data_strobe: STD_LOGIC;
signal start_ena : STD_LOGIC;

-- PMW
signal angle_a, angle_b, angle_c, angle_d, angle_e, angle_f, angle_g, angle_h, angle_i, angle_j: STD_LOGIC_VECTOR (7 downto 0);

signal angle, id : STD_LOGIC_VECTOR (7 downto 0);

begin

-- Impedancia a todos los puertos del PMOD que no se usan
imp <= "ZZZZZZ";

CLK_Zatitzailea: FrekuentziaZatitzailea port map(
                                                clk=>clk,
                                                clk_pmw=>clk_pmw,
                                                en_16_x_baud=>clk_16_x,
                                                clk_refresh=>clk_refresh);
                                                
RX: kcuart_rx port map(
                    serial_in=>serial_in,
                    data_out=>data,
                    data_strobe=>data_strobe,
                    en_16_x_baud=>clk_16_x,
                    clk=>clk);
                    
DISPLAY: nagusia_display port map ( clk=> clk_refresh,
                                    id => id,
                                    grado => angle,
                                    an => an,
                                    seg => seg);

MEMORIA : Data_memoria port map( clk => clk,
                             ena => start,
                             reset => reset,
                             data_in => data,
                             data_receive => data_strobe,
                             led_send => led_send,
                             led_angle => led_angle,
                             led_id => led_id,
                             led_idle => led_idle,
                             led_off => led_off,
                             angle_out => angle,
                             id_out => id);
                             
SELECTOR_ANGLE : selector port map ( clk => clk,
                                     reset => reset,
                                     id => id,
                                     angle => angle,
                                     angle_a => angle_a,
                                     angle_b => angle_b,
                                     angle_c => angle_c,
                                     angle_d => angle_d,            
                                     angle_e => angle_e,
                                     angle_f => angle_f,
                                     angle_g => angle_g,
                                     angle_h => angle_h,
                                     angle_i => angle_i,            
                                     angle_j => angle_j);
                          
A_HAND: PWM_controller port map (   clk => clk,
                                    clk_pmw => clk_pmw,
                                    angle_byte => angle_a,
                                    pmw => a_pmw_port);
                                    
B_HAND: PWM_controller port map (   clk => clk,
                                    clk_pmw => clk_pmw,
                                    angle_byte => angle_b,
                                    pmw => b_pmw_port);
                                    
C_HAND: PWM_controller port map (   clk => clk,
                                    clk_pmw => clk_pmw,
                                    angle_byte => angle_c,
                                    pmw => c_pmw_port);
                                    
D_HAND: PWM_controller port map (   clk => clk,
                                    clk_pmw => clk_pmw,
                                    angle_byte => angle_d,
                                    pmw => d_pmw_port);
                                    
E_HAND: PWM_controller port map (   clk => clk,
                                    clk_pmw => clk_pmw,
                                    angle_byte => angle_e,
                                    pmw => e_pmw_port);
                                    
F_HAND: PWM_controller port map (   clk => clk,
                                    clk_pmw => clk_pmw,
                                    angle_byte => angle_f,
                                    pmw => f_pmw_port);
                                    
G_HAND: PWM_controller port map (   clk => clk,
                                    clk_pmw => clk_pmw,
                                    angle_byte => angle_g,
                                    pmw => g_pmw_port);
                                    
H_HAND: PWM_controller port map (   clk => clk,
                                    clk_pmw => clk_pmw,
                                    angle_byte => angle_h,
                                    pmw => h_pmw_port);
                                    
I_HAND: PWM_controller port map (   clk => clk,
                                    clk_pmw => clk_pmw,
                                    angle_byte => angle_i,
                                    pmw => i_pmw_port);
                                    
J_HAND: PWM_controller port map (   clk => clk,
                                    clk_pmw => clk_pmw,
                                    angle_byte => angle_j,
                                    pmw => j_pmw_port);
end Behavioral;
