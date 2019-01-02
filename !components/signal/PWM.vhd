library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PWM is

	generic
	(
		clk_freq_MHz  : natural := 50;
		T_out_ms      : natural := 1000
	);

	port
	(
		in_clk	: in  std_logic;   --      -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
		pulse		: out std_logic;   --      -___________-___________-___________   pulse iste frekvencije kao i in_clk, ali vecinu vremena je 0
		pause		: in  std_logic := '0';
		reset	  	: in  std_logic := '0'
	);

end entity;

architecture rtl of PWM is   --equivalent to rising_edge on clk_divider
	constant maxnum : natural := (T_out_ms * clk_freq_MHz * 1000)/2 - 1;   -- poluperioda;   T_out_ms/1,000 (s) * clk_freq_MHz * 1,000,000 (1/s)
	signal buff : std_logic_vector(1 downto 0) := (others => '0');
begin

	process (in_clk)
		variable cnt : natural range 0 to maxnum := 0;   --broji se od 0 do maxnum

	begin
		if (rising_edge(in_clk)) then

			if    reset  = '1' then cnt := 0;
			elsif pause /= '1' then cnt := cnt + 1;
			end if;
			

			if cnt = 0 then buff <= buff(0) & '1';   --buff(1)  buff(0)  <-  next
			else            buff <= buff(0) & '0';
			end if;
			
			
		end if;
	end process;
	
	pulse <= '1' when buff = "01" else '0';

end rtl;
