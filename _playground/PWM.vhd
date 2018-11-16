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
		in_clk	: in  std_logic;   --                                                                 -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
		pulse		: out std_logic;   --pulse iste frekvencije kao i in_clk, ali vecinu vremena je 0 :   -___________-___________-___________
		reset	  	: in  std_logic := '0';
		pause		: in  std_logic := '0'
	);

end entity;

architecture rtl of PWM is
	constant maxnum : natural := (T_out_ms * clk_freq_MHz * 1000)/2 - 1;   -- poluperioda;   T_out_ms/1,000 (s) * clk_freq_MHz * 1,000,000 (1/s)
begin

	process (in_clk)
		variable cnt : natural range maxnum downto 0;   --broji se od maxnum do 0
		variable pulse_next : std_logic := '0';
	begin
	
		if (rising_edge(in_clk)) then

			if    reset = '1' then cnt := maxnum;
			elsif pause = '0' then cnt := cnt - 1;
			end if;
			
			-- izlazni signal menja polaritet na svaku poluperiodu
			if cnt = 0 then
				pulse_next := not pulse_next;
			end if;
			
			if rising_edge(pulse_next) then pulse <= '1';
			else                            pulse <= '0';
			end if;
			
			
		end if;
		
	end process;

end rtl;
