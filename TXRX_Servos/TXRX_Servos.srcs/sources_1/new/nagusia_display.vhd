----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.01.2021 14:19:47
-- Design Name: 
-- Module Name: nagusia_display - Behavioral
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

entity nagusia_display is
    Port ( clk : in STD_LOGIC;
           id : in STD_LOGIC_VECTOR (7 downto 0);
           grado : in STD_LOGIC_VECTOR (7 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (7 downto 0);
           rst : in STD_LOGIC);
end nagusia_display;

architecture Behavioral of nagusia_display is

component display7 is
    Port ( clk : in STD_LOGIC;
           signal_in : in STD_LOGIC_VECTOR (7 downto 0);
           seg_out : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component EM_display is
   Port ( clk : in STD_LOGIC;
          zenb_bateko : in STD_LOGIC_VECTOR (7 downto 0);
          zenb_hamarreko : in STD_LOGIC_VECTOR (7 downto 0);
          zenb_id: in STD_LOGIC_VECTOR (7 downto 0);
          anodo : out STD_LOGIC_VECTOR (3 downto 0);
          katodo : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component divisor_display is
    Port ( clk : in STD_LOGIC;
           zenb : in STD_LOGIC_VECTOR (7 downto 0);
           bateko : out STD_LOGIC_VECTOR (7 downto 0);
           hamarreko : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal data_bateko, data_hamarreko: STD_LOGIC_VECTOR (7 downto 0);
signal zenb_bateko, zenb_hamarreko, zenb_id: STD_LOGIC_VECTOR (7 downto 0);

begin
            
CONTROL_Display: divisor_display port map ( clk => clk,
                                           zenb => grado,
                                           bateko => data_bateko,
                                           hamarreko => data_hamarreko);
                           
DISPLAY_D: display7 port map ( clk => clk,
                               signal_in => data_bateko,
                               seg_out => zenb_bateko);
                        
DISPLAY_C: display7 port map ( clk => clk,
                               signal_in => data_hamarreko,
                               seg_out => zenb_hamarreko);
                        
DISPLAY_id: display7 port map ( clk => clk,
                                signal_in => id,
                                seg_out => zenb_id);

                         
EM: EM_display port map ( clk => clk,
                          zenb_id => zenb_id,
                          zenb_bateko => zenb_bateko,
                          zenb_hamarreko => zenb_hamarreko,
                          anodo => an,
                          katodo => seg);

end Behavioral;
