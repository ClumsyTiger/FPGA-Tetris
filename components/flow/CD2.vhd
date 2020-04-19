library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity CD2 is
	
	port 
	(
		X	: in  std_logic_vector(1 downto 0) := (others => '0');
		S  : out std_logic_vector(0 downto 0);
		en : out std_logic
	);

end entity;

architecture rtl of CD2 is   --register transfer level
begin

	S <= "1" when X >= "10" else
		  "0";
		  
	en <= '1' when X /= 0 else '0';

end rtl;
