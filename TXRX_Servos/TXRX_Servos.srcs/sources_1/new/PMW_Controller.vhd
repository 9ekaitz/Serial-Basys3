----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.12.2020 13:42:43
-- Design Name: 
-- Module Name: PWM_controller - Behavioral
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
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PWM_controller is
    Port ( clk : in STD_LOGIC;
           clk_pmw : in STD_LOGIC;
           angle_byte : in STD_LOGIC_VECTOR (7 downto 0);
           pmw : out STD_LOGIC);
end PWM_controller;

architecture Behavioral of PWM_controller is

type STATE is(IDLE,SEND);
signal kont_idle, kont_send, angle,aux1, aux2 : Integer:=0; -- Contadores
signal current, next_state: STATE; -- Estados

begin

angle <= conv_integer(signed(angle_byte)); 
aux1 <= 19998 - (500 +16*angle); -- El tiempo que tiene que estar la señal de PWM bajado
aux2 <= 500 + 16*angle; -- El tiempo que tiene que estar la señal de PWM arriba

SEQ: process (clk_pmw, current)
begin 
    if clk_pmw'event and clk_pmw = '1' then
      current <= next_state;
       if current = IDLE then     
           kont_idle <= kont_idle + 1; -- Se cuenta cuanto tiempo esta la señal bajada
           kont_send <= 0;
       else
           kont_send <= kont_send + 1; -- Se cuenta cuanto tiempo esta la señal arriba
           kont_idle <= 0;
       end if;  
    end if;
end process SEQ;

COMB: process (current, kont_idle, kont_send)
begin
    case current is
    when IDLE =>
        pmw <= '0'; -- Señal PWM 
        if kont_idle >= aux1 then
           next_state <= SEND; -- Cuando se termine el tiempo que tiene que estar la señal baja pasa a estar subida
        else
           next_state <= current;
        end if;
    when SEND =>
        pmw <= '1';  
        if kont_send >= aux2 then
           next_state <= IDLE; -- Cuando se termine el tiempo que tiene que estar la señal arriba pasa a estar abajo
        else
           next_state <= current;
        end if;
    end case;
end process COMB;
end Behavioral;
