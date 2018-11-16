library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PWM is

	generic
	(
		clk_freq_MHz  : natural := 50;
		T_out_ms      : natural := 100
	);

	port
	(
		in_clk	: in  std_logic;   --      -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
		pulse		: out std_logic;   --      -___________-___________-___________   pulse iste frekvencije kao i in_clk, ali vecinu vremena je 0
		reset	  	: in  std_logic := '0';
		pause		: in  std_logic := '0'
	);

end entity;

architecture rtl of PWM is   --equivalent to rising_edge on clk_divider
	constant maxnum : natural := (T_out_ms * clk_freq_MHz * 1000)/2 - 1;   -- poluperioda;   T_out_ms/1,000 (s) * clk_freq_MHz * 1,000,000 (1/s)
	signal buff : std_logic_vector(1 downto 0) := (others => '0');
begin

	process (in_clk)
		variable cnt : natural range maxnum downto 0 := maxnum;   --broji se od maxnum do 0
		variable out_clk_next : std_logic := '0';
	begin
	
		if (rising_edge(in_clk)) then

			if    reset = '1' then cnt := maxnum;
			elsif pause = '0' then cnt := cnt - 1;
			end if;
			
			-- izlazni signal menja polaritet na svaku poluperiodu
			if cnt = 0 then
				out_clk_next := not out_clk_next;
				buff <= buff(0) & out_clk_next;
			end if;
			
			
		end if;
		
	end process;
	
	pulse <= '1' when buff = "01" else '0';

end rtl;
