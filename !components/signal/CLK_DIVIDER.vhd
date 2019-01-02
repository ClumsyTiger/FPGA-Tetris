library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CLK_DIVIDER is

	generic
	(
		clk_freq_MHz  : natural := 50;
		T_out_ms      : natural := 1000
	);

	port
	(
		in_clk	: in  std_logic;   --      -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
		out_clk	: out std_logic;   --      ------______------______------______   out_clk nize frekvencije od in_clk
		pause		: in  std_logic := '0';
		reset	  	: in  std_logic := '0'
	);

end entity;

architecture rtl of CLK_DIVIDER is
	constant maxnum : natural := (T_out_ms * clk_freq_MHz * 1000)/2 - 1;   -- poluperioda;   T_out_ms/1,000 (s) * clk_freq_MHz * 1,000,000 (1/s)
	
begin

	process (in_clk)
		variable cnt : natural range 0 to maxnum := 0;   --broji se od 0 do maxnum
		variable out_clk_next: std_logic := '0';
	begin
		if (rising_edge(in_clk)) then

			if    reset  = '1' then cnt := 0;
			elsif pause /= '1' then cnt := cnt + 1;
			end if;
			
			-- izlazni signal menja polaritet na svaku poluperiodu
			if cnt = 0 then
				out_clk_next := not out_clk_next;
			end if;
			
			
		end if;
		out_clk <= out_clk_next;
	
	end process;
	
end rtl;
