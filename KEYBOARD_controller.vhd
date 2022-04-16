----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:55:31 04/21/2011 
-- Design Name: 
-- Module Name:    KEYBOARD_controller - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity KEYBOARD_controller is
    Port ( CLK : in  STD_LOGIC;
				scancode_in : in  STD_LOGIC_VECTOR (7 downto 0);
           fok : in  STD_LOGIC; -- tic
           press : out  STD_LOGIC:='0'; -- tic
			  unpress : out  STD_LOGIC:='0'; -- tic
           keycode : out  STD_LOGIC_VECTOR (9 downto 0)); --scancode,e0,e1
end KEYBOARD_controller;

architecture Behavioral of KEYBOARD_controller is

begin

process(CLK)
	variable keycode_mem:std_logic_vector(keycode'range);
	variable press_mem : std_logic:='0';
	variable unpress_mem : std_logic:='0';
	variable is_e0:std_logic:='0';
	variable is_e1:std_logic:='0';
	variable releasing:boolean:=false;
begin
	if rising_edge(CLK) then
		press<='0';
		unpress<='0';
		if fok='1' then
			-- les commandes
			if scancode_in = x"FA" or scancode_in= x"AA" or scancode_in= x"EE" or scancode_in= x"FE" or scancode_in= x"00" or scancode_in= x"FF" then
				--ignore
			elsif releasing and not(scancode_in = x"F0" or scancode_in= x"E0") then
				-- on est en train de relacher la touche RX_ShiftReg
				-- de toute façon c'est tout pourri le PS/2 on peut pas appuyer sur beaucoup de touche à la fois...
				releasing:=false;
				unpress<='1';
				
				keycode_mem:=is_e0 & is_e1 & scancode_in;
				keycode<=keycode_mem;
				is_e0:='0';
				is_e1:='0';
			else
				if scancode_in = x"F0" then
					-- c'est un relachement
					-- il faut zapper le paquet suivant !
					releasing:=true;
				elsif scancode_in = x"E0" then
					-- on s'en fou le paquet suivant c'est F0
					is_e0:='1';
				elsif scancode_in = x"E1" then
					-- on s'en fou le paquet suivant c'est F0
					is_e1:='1';
				else
					-- c'est une touche
					keycode_mem:=is_e0 & is_e1 & scancode_in;
					keycode<=keycode_mem;
					is_e0:='0';
					is_e1:='0';
					press<='1';
				end if;
			end if;
		end if;
	end if;
end process;

end Behavioral;

