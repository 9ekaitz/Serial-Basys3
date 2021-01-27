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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Data_memoria is
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
end Data_memoria;

architecture Behavioral of Data_memoria is

type egoera is (off, id_received, check_id, angle_received, idle, send_data);
signal oraingoa, hurrengoa: egoera;
signal angle, id : STD_LOGIC_VECTOR (7 downto 0);

begin

SEQ: process (clk, reset)
begin
if reset = '1' then
    oraingoa <= off; -- Cuando se pulsa el boton de reset se pasa al estado de desarmado, y se extiende la mano
elsif clk'event and clk='1' then
    oraingoa<=hurrengoa;
end if;
end process;

COMB: process (oraingoa,clk)

begin
    case oraingoa is
    
        when off =>       -- Estado donde el brazo robotico está desarmado
            if ena = '1' then  -- Cuando se arme con el switch pasar a estado de espera de datos
                hurrengoa <= idle;
            else
                hurrengoa <= off;
            end if;     
        
         when idle =>   -- Estado de espera de datos
                if data_receive = '1' then -- Cuando se recive un dato
                    hurrengoa <= check_id; -- Siguiente estado, comparar si el identificador es el correcto
                else
                    hurrengoa <= idle;
                end if;
            
          when id_received =>  -- Estado donde tenemos el dato del identificador y esperamos al siguiente dato, el angulo
               if data_receive = '1' then
                   hurrengoa <= angle_received;
               else
                   hurrengoa <= id_received;
               end if;
             
          when check_id =>  -- Estado donde se comprueba que el dato recivido es un identificador y no un angulo u otro dato/ruido
               if data_in="01100100" or data_in="01100101" or data_in="01100110" or data_in="01100111" or data_in="01101000" or
                  data_in="01101001" or data_in="01101010" or data_in="01101011" or data_in="01101100" or data_in="01101101" then
                   hurrengoa <= id_received; -- Si el identificador es el correcto pasamos al estado donde esperamos al angulo
               else
                   hurrengoa <= idle;
               end if;
               
          when angle_received =>  -- Estado donde tenemos el angulo
               hurrengoa <= send_data; -- Dado que ya tenemos los dos datos (id y angulo), se mandan
              
                             
          when send_data =>  -- Estado donde se mandan los datos
               hurrengoa <= idle; -- Una vez mandado los datos, volvemos al estado idle
               
    end case;

end process;


SEQ2: process (clk)  -- Memoria
begin

if clk'event and clk='1' then

    if oraingoa = check_id then
        id <= data_in; -- Se guarda el dato en memoria como id
        
        led_id <= '1';
        led_angle <= '0';
        led_idle <= '0';
        led_send <= '0'; 
        led_off <= '0';
        
    elsif oraingoa = angle_received then
        angle <= data_in;  -- Se guarda el dato en memoria como angulo
        
        led_id <= '0';
        led_angle <= '1';
        led_idle <= '0';
        led_send <= '0';
        led_off <= '0';
        
    elsif oraingoa = send_data then
        id_out <= id;  -- Se sacan las señales id y angulo por las salidas del componente
        angle_out <= angle;
        
        led_id <= '0';
        led_angle <= '0';
        led_idle <= '0';
        led_send <= '1';
        led_off <= '0';
        
    elsif oraingoa = idle then
        led_id <= '0';
        led_angle <= '0';
        led_idle <= '1';
        led_send <= '0';
        led_off <= '0';
        
    elsif oraingoa = off then
        id_out <= "00000000"; -- Cuando se desarma el robot (pulsando el reset) , las salidas de id y angulo se ponen a 0 para que se visualize el display
        angle_out <= "00000000";
        
        led_id <= '0';
        led_angle <= '0';
        led_idle <= '0';
        led_send <= '0';
        led_off <= '1';
    end if;
end if;
end process;

end Behavioral;

