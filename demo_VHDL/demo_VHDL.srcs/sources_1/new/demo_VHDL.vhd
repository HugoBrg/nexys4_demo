----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2018 11:20:58
-- Design Name: 
-- Module Name: demo_VHDL - Behavioral
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

entity demo_VHDL is

port (
		swt : in STD_LOGIC_VECTOR(7 downto 0);
		led : out STD_LOGIC_VECTOR(7 downto 0)
	);
end demo_VHDL;

architecture Behavioral of demo_VHDL is

Signal led_int : STD_LOGIC_VECTOR(7 downto 0) := "00000000";

begin

        led <= led_int;
        
		led_int(0) <= not(swt(0));
		led_int(1) <= swt(1) and not(swt(2));
		led_int(3) <= swt(2) and swt(3);
		led_int(2) <= led_int(1) or led_int(3);

		led_int(7 downto 4) <= swt(7 downto 4);

end Behavioral;
