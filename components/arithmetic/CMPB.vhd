library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CMPB is

	generic
	(
		wid : natural := 10;
		B	 : natural := 0
	);

	port 
	(
		A	: in  std_logic_vector(wid-1 downto 0) := (others => '0');
		
		gr : out std_logic;
		eq : out std_logic;
		ls : out std_logic
	);

end entity;

architecture rtl of CMPB is
begin

	gr <= '1' when A > B else '0';
	eq <= '1' when A = B else '0';
	ls <= '1' when A < B else '0';
		
end rtl;
