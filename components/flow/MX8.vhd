library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity MX8 is
	
	generic
	(
		wid : natural := 10   --input signal width
	);

	port 
	(
		X0	: in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X1	: in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X2 : in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X3	: in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X4	: in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X5	: in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X6 : in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X7	: in  std_logic_vector(wid-1 downto 0) := (others => '0');
		Y  : out std_logic_vector(wid-1 downto 0);
		
		en : in  std_logic := '0';
		S  : in  std_logic_vector(2     downto 0) := (others => '0')
	);

end entity;


-- =============================================================================
--    IF   and CASE can only be used inside a process.
--    WHEN and WITH can only be used outside a process.
--
--    IF   corresponds to WHEN
--    CASE corresponds to WITH
-- =============================================================================

architecture rtl of MX8 is   --register transfer level
begin

	Y <= (others => '0') when not en = '1' else
		  X0  when S = "000" else
		  X1  when S = "001" else
		  X2  when S = "010" else
		  X3  when S = "011" else
		  
		  X4  when S = "100" else
		  X5  when S = "101" else
		  X6  when S = "110" else
		  X7;
		  
		  --'X' when others; - In these situations, it is traditional to use 'X' as a placeholder to indicate "Don't Care" when building truth tables.

end rtl;
