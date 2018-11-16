library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity DC2 is
	
	port 
	(
		S	: in  std_logic_vector(0 downto 0) := (others => '0');
		X  : out std_logic_vector(1 downto 0);
		en : in  std_logic := '0'
	);

end entity;

architecture rtl of DC2 is   --register transfer level
begin

	X <= "00" when not en = '1' else
		  "10" when S = "1" else
		  "01";

end rtl;
