library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RF_EDGE is

	port
	(
		sig_in : in  std_logic;
		ris	 : out std_logic;
		fal    : out std_logic;
		
		clk	 : in  std_logic
	);

end entity;


architecture rtl of RF_EDGE is
	signal buff : std_logic_vector(1 downto 0) := (others => '0');
begin

	process (clk)
	begin
		if (rising_edge(clk)) then
			buff <= buff(0) & sig_in;
		end if;
		
	end process;

	ris <= '1' when buff = "01" else '0';
	fal <= '1' when buff = "10" else '0';
	
end rtl;
