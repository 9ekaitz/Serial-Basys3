----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2020 15:10:20
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( --data_in : in STD_LOGIC_VECTOR (7 downto 0);
           send_character : in STD_LOGIC;
           clk : in STD_LOGIC;
           serial_out : out STD_LOGIC;
           Tx_complete : out STD_LOGIC;
           imp: out STD_LOGIC_VECTOR (6 downto 0));
end top;

architecture Behavioral of top is

component FrekuentziaZatitzailea is
    Port ( clk : in STD_LOGIC;
           en_16_x_baud : out STD_LOGIC);
end component;

component kcuart_tx is
    Port (        data_in : in std_logic_vector(7 downto 0);
           send_character : in std_logic;
             en_16_x_baud : in std_logic;
               serial_out : out std_logic;
              Tx_complete : out std_logic;
                      clk : in std_logic);
end component;

signal clk_16_x: STD_LOGIC;
-- signal dataChar: std_logic_vector(to_unsigned('G',8));
signal dataChar: std_logic_vector(7 downto 0) := "01000111";
begin

imp <= "ZZZZZZZ";

U1: FrekuentziaZatitzailea port map(
            clk=>clk,
            en_16_x_baud=>clk_16_x);
            
U2: kcuart_tx port map(
            data_in=>dataChar,
            send_character=>send_character,
            en_16_x_baud=>clk_16_x,
            clk=>clk,
            serial_out=>serial_out,
            Tx_complete=>Tx_complete);

end Behavioral;
