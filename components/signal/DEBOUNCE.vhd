library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity DEBOUNCE is

	generic
	(
		wid : natural := 10
	);

	port
	(
		sig_in : in  std_logic;		
		deb    : out std_logic;
		
		clk	 : in  std_logic
	);

end entity;


architecture rtl of DEBOUNCE is
	signal buff : std_logic_vector(wid-1 downto 0) := (others => '0');   --signal buffer
	signal deb_curr, deb_next : std_logic := '0';
begin

	process (clk)
	begin
		if (rising_edge(clk)) then
			buff <= buff(wid-2 downto 0) & sig_in;   --buffer (prozor sirine 10) klizi na desnu stranu kroz signal (na t-osi)
			deb  <= deb_next;

			deb_curr <= deb_next;
		end if;
	end process;

	process (deb_curr, deb_next, buff)
	begin
		if        buff = 0 then deb_next <= '1';
		elsif not buff = 0 then deb_next <= '0';
		else                    deb_next <= deb_curr;
		end if;
	end process;

end rtl;
