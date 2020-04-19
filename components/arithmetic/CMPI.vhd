library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CMPI is

	generic
	(
		wid : natural := 10;
		A   : natural := 0;
		B   : natural := 0
	);

	port 
	(
		C    : in  std_logic_vector(wid-1 downto 0) := (others => '0');
		
		gr   : out std_logic;
		isin : out std_logic;
		ls   : out std_logic
	);

end entity;

architecture rtl of CMPI is
begin

	gr   <= '1' when            C >  B else '0';
	isin <= '1' when C >= A and C <= B else '0';
	ls   <= '1' when C <  A            else '0';
		
end rtl;
