library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity DC8 is
	
	port 
	(
		S	: in  std_logic_vector(2 downto 0) := (others => '0');
		X  : out std_logic_vector(7 downto 0);
		en : in  std_logic := '0'
	);

end entity;

architecture rtl of DC8 is   --register transfer level
begin

	X <= "00000000" when not en = '1' else
		  "10000000" when S = "111" else
		  "01000000" when S = "110" else
		  "00100000" when S = "101" else
		  "00010000" when S = "100" else
		  "00001000" when S = "011" else
		  "00000100" when S = "010" else
		  "00000010" when S = "001" else
		  "00000001";

end rtl;
