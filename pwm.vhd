library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- http://www.fpga4fun.com/PWM_DAC.html

entity PWM is
  port (
   clk : in std_logic;
   PWM_in : in std_logic_vector (7 downto 0) := "00000000";
   PWM_out : out std_logic
  );
end PWM;

architecture PWM_arch of PWM is
  signal  PWM_Accumulator : std_logic_vector(8 downto 0):=(others=>'0'); -- sim XXXXXXXXX
begin
  process
  begin
    wait until rising_edge(clk);
			PWM_Accumulator  <=  ("0" & PWM_Accumulator(7 downto 0)) + ("0" & PWM_in);
  end process;
  PWM_out <= PWM_Accumulator(8);
end PWM_arch;
