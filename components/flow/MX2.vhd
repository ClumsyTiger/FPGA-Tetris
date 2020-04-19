library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity MX2 is
	
	generic
	(
		wid : natural := 10   --input signal width
	);

	port 
	(
		X0	: in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X1	: in  std_logic_vector(wid-1 downto 0) := (others => '0');
		Y  : out std_logic_vector(wid-1 downto 0);
		
		en : in  std_logic := '0';
		S  : in  std_logic_vector(0     downto 0) := (others => '0')
	);

end entity;


-- =============================================================================
--    IF   and CASE can only be used inside a process.
--    WHEN and WITH can only be used outside a process.
--
--    IF   corresponds to WHEN
--    CASE corresponds to WITH
-- =============================================================================

architecture rtl of MX2 is   --register transfer level
begin

	Y <= (others => '0') when not en = '1' else
	     X0  when S = "0" else
		  X1;
		  
		  --'X' when others; - In these situations, it is traditional to use 'X' as a placeholder to indicate "Don't Care" when building truth tables.

end rtl;
