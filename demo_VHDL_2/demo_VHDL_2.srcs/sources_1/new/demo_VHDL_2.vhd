----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.04.2018 16:35:11
-- Design Name: 
-- Module Name: demo_VHDL_2 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity demo_VHDL_2 is
    Port (
            clk : in STD_LOGIC :='0';
            swt : in STD_LOGIC_VECTOR(7 downto 0);
            led : inout STD_LOGIC_VECTOR(7 downto 0);
            an : inout STD_LOGIC_VECTOR(7 downto 0);
            seg : out STD_LOGIC_VECTOR(6 downto 0)
          );
end demo_VHDL_2;

architecture Behavioral of demo_VHDL_2 is
    signal count : integer :=1;
    Signal led_int : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
begin
    process(clk)
    variable I : integer range 0 to 7;
    begin
    led <= led_int;           
    led_int(0) <= not(swt(0));
    led_int(1) <= swt(1) and not(swt(2));
    led_int(3) <= swt(2) and swt(3);
    led_int(2) <= led_int(1) or led_int(3);
    led_int(5 downto 4) <= swt(5 downto 4);   
        if(clk'event and clk='1') then
            count <=count+1;
            if(count = 10000000) then
                an(0)<='1';
                an(1)<='1';
                an(2)<='1';
                an(3)<='1';
                an(4)<='1';
                an(5)<='1';
                an(6)<='1';
                an(7)<='1';
                an(I-1)<='0';
                an(I)<='0';
                I:=I+1;
                if(I = 8) then
                    I:=0;
                end if;
                seg<="1110111";
                led_int(6) <= NOT led_int(6);
                led_int(7) <= led_int(6);
                count <=1;             
            end if;
        end if;
    end process;
end Behavioral;
