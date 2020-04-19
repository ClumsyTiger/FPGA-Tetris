library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CONST is

	generic
	(
		wid   : natural  := 10;
		const : integer  := 0
	);

	port 
	(
		data: out std_logic_vector(wid-1 downto 0)
	);

end entity;

architecture rtl of CONST is
begin
	data <= std_logic_vector(to_signed(const, wid));
end rtl;
