library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity DC16 is
	
	port 
	(
		S	: in  std_logic_vector(3  downto 0) := (others => '0');
		X  : out std_logic_vector(15 downto 0);
		en : in  std_logic := '0'
	);

end entity;

architecture rtl of DC16 is   --register transfer level
begin

	X <= "00000000" & "00000000" when not en = '1' else
	     
		  "10000000" & "00000000" when S = "1111" else
		  "01000000" & "00000000" when S = "1110" else
		  "00100000" & "00000000" when S = "1101" else
		  "00010000" & "00000000" when S = "1100" else
		            
		  "00001000" & "00000000" when S = "1011" else
		  "00000100" & "00000000" when S = "1010" else
		  "00000010" & "00000000" when S = "1001" else
		  "00000001" & "00000000" when S = "1000" else
		  
		  "00000000" & "10000000" when S = "0111" else
		  "00000000" & "01000000" when S = "0110" else
		  "00000000" & "00100000" when S = "0101" else
		  "00000000" & "00010000" when S = "0100" else
		  
		  "00000000" & "00001000" when S = "0011" else
		  "00000000" & "00000100" when S = "0010" else
		  "00000000" & "00000010" when S = "0001" else
		  "00000000" & "00000001";
		  
end rtl;
