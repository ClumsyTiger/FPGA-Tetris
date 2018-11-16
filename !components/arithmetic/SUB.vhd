library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SUB is

	generic
	(
		wid : natural := 10
	);

	port 
	(
		A	: in  std_logic_vector(wid-1 downto 0) := (others => '0');
		B	: in  std_logic_vector(wid-1 downto 0) := (others => '0');
		Ei : in  std_logic := '0';
		
		F	: out std_logic_vector(wid-1 downto 0);
		Ej : out std_logic
	);

end entity;

architecture rtl of SUB is
	signal temp : std_logic_vector( wid downto 0 );
begin

	F  <= A - B - Ei;
	Ej <= '1' when A < B + Ei else '0';
		
end rtl;
