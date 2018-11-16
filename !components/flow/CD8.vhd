library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity CD8 is
	
	port 
	(
		X	: in  std_logic_vector(7 downto 0) := (others => '0');
		S  : out std_logic_vector(2 downto 0);
		en : out std_logic
	);

end entity;

architecture rtl of CD8 is   --register transfer level
begin

	S <= "111" when X >= "10000000" else
		  "110" when X >= "01000000" else
		  "101" when X >= "00100000" else
		  "100" when X >= "00010000" else
		  "011" when X >= "00001000" else
		  "010" when X >= "00000100" else
		  "001" when X >= "00000010" else
		  "000";
		  
	en <= '1' when X /= 0 else '0';

end rtl;
