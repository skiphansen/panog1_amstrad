----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:08:43 01/25/2011 
-- Design Name: 
-- Module Name:    ROMselect - Behavioral 
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

entity ROMselect is
    Port ( CLK:in STD_LOGIC;
			  A13 : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           IO_WR : in  STD_LOGIC;
           ROMbank : out  STD_LOGIC_VECTOR (3 downto 0));
end ROMselect;

architecture Behavioral of ROMselect is
	signal init_ROMbank: STD_LOGIC_VECTOR (3 downto 0):=(others=>'0'); -- it's upper ROM number in fact
begin
	ROMbank<=init_ROMbank;
	process(CLK) is
		variable ROMbank_mem: STD_LOGIC_VECTOR (3 downto 0);
	begin
		if rising_edge(CLK) then
			if IO_WR='1' and A13='0' then
				ROMbank_mem(3 downto 0):=D(3 downto 0);
				init_ROMbank<=ROMbank_mem;
			end if;
		end if;
	end process;
end Behavioral;

