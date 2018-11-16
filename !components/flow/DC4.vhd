library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity DC4 is
	
	port 
	(
		S	: in  std_logic_vector(1 downto 0) := (others => '0');
		X  : out std_logic_vector(3 downto 0);
		en : in  std_logic := '0'
	);

end entity;

architecture rtl of DC4 is   --register transfer level
begin

	X <= "0000" when not en = '1' else
		  "1000" when S = "11" else
		  "0100" when S = "10" else
		  "0010" when S = "01" else
		  "0001";

end rtl;
