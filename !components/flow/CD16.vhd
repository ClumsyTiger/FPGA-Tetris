library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity CD16 is
	
	port 
	(
		X	: in  std_logic_vector(15 downto 0) := (others => '0');
		S  : out std_logic_vector(3  downto 0);
		en : out std_logic
	);

end entity;

architecture rtl of CD16 is   --register transfer level
begin

	S <= "1111" when X >= "10000000" & "00000000" else
		  "1110" when X >= "01000000" & "00000000" else
		  "1101" when X >= "00100000" & "00000000" else
		  "1100" when X >= "00010000" & "00000000" else
		  
		  "1011" when X >= "00001000" & "00000000" else
		  "1010" when X >= "00000100" & "00000000" else
		  "1001" when X >= "00000010" & "00000000" else
		  "1000" when X >= "00000001" & "00000000" else
		  
		  "0111" when X >= "00000000" & "10000000" else
		  "0110" when X >= "00000000" & "01000000" else
		  "0101" when X >= "00000000" & "00100000" else
		  "0100" when X >= "00000000" & "00010000" else
		  
		  "0011" when X >= "00000000" & "00001000" else
		  "0010" when X >= "00000000" & "00000100" else
		  "0001" when X >= "00000000" & "00000010" else
		  "0000";

	en <= '1' when X /= 0 else '0';

end rtl;
