library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ADD is

	generic
	(
		wid : natural := 10
	);

	port 
	(
		A	: in  std_logic_vector(wid-1 downto 0) := (others => '0');
		B	: in  std_logic_vector(wid-1 downto 0) := (others => '0');
		Ci : in  std_logic := '0';
		
		F	: out std_logic_vector(wid-1 downto 0);
		Cj : out std_logic
	);

end entity;

architecture rtl of ADD is
	signal temp : std_logic_vector( wid downto 0 );
begin

	temp <= ('0' & A) + ('0' & B) + Ci;
	F  <= temp(wid-1 downto 0);
	Cj <= temp(wid);
		
end rtl;
