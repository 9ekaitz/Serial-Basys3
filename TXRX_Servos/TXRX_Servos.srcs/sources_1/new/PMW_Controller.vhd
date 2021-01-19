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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PWM_controller is
    Port ( clk : in STD_LOGIC;
           angle_byte : in STD_LOGIC_VECTOR (7 downto 0);
           pwm : out STD_LOGIC);
end PWM_controller;

architecture Behavioral of PWM_controller is

type STATE is(IDLE,SEND);
signal kont_idle, kont_send, angle,aux1, aux2 : Integer:=0;
signal current, next_state: STATE;

begin

-- angle <= conv_integer(unsigned(angle_byte));
angle <= 25;
aux1 <= 19998 - (1000 +8*angle);
aux2 <= 1000 + 8*angle;

SEQ: process (clk, current)
begin 
    if clk'event and clk = '1' then
      current <= next_state;
       if current = IDLE then     
           kont_idle <= kont_idle + 1;
           kont_send <= 0;
       else
           kont_send <= kont_send + 1;
           kont_idle <= 0;
       end if;  
    end if;
end process SEQ;

COMB: process (current, kont_idle, kont_send)
begin
    case current is
    when IDLE =>
        pwm <= '0';
        if kont_idle = aux1 then
           next_state <= SEND;
        else
           next_state <= current;
        end if;
    when SEND =>
        pwm <= '1';
        if kont_send = aux2 then
           next_state <= IDLE;
        else
            next_state <= current;
        end if;
    end case;
end process COMB;
end Behavioral;
