library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity CD4 is
	
	port 
	(
		X	: in  std_logic_vector(3 downto 0) := (others => '0');
		S  : out std_logic_vector(1 downto 0);
		en : out std_logic
	);

end entity;

architecture rtl of CD4 is   --register transfer level
begin

	S <= "11" when X >= "1000" else
		  "10" when X >= "0100" else
		  "01" when X >= "0010" else
		  "00";
		  
	en <= '1' when X /= 0 else '0';

end rtl;
