library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity MX16 is
	
	generic
	(
		wid : natural := 10   --input signal width
	);

	port 
	(
		X00 : in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X01 : in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X02 : in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X03 : in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X04 : in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X05 : in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X06 : in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X07 : in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X08 : in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X09 : in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X10 : in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X11 : in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X12 : in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X13 : in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X14 : in  std_logic_vector(wid-1 downto 0) := (others => '0');
		X15 : in  std_logic_vector(wid-1 downto 0) := (others => '0');
		Y   : out std_logic_vector(wid-1 downto 0);
      
		en  : in  std_logic := '0';
		S   : in  std_logic_vector(3     downto 0) := (others => '0')
	);

end entity;


-- =============================================================================
--    IF   and CASE can only be used inside a process.
--    WHEN and WITH can only be used outside a process.
--
--    IF   corresponds to WHEN
--    CASE corresponds to WITH
-- =============================================================================

architecture rtl of MX16 is   --register transfer level
begin

	Y <= (others => '0') when not en = '1' else
		  X00 when S = "0000" else
		  X01 when S = "0001" else
		  X02 when S = "0010" else
		  X03 when S = "0011" else
		  
		  X04 when S = "0100" else
		  X05 when S = "0101" else
		  X06 when S = "0110" else
		  X07 when S = "0111" else
		  
		  X08 when S = "1000" else
		  X09 when S = "1001" else
		  X10 when S = "1010" else
		  X11 when S = "1011" else
		  
		  X12 when S = "1100" else
		  X13 when S = "1101" else
		  X14 when S = "1110" else
		  X15;
		  
		  --'X' when others; - In these situations, it is traditional to use 'X' as a placeholder to indicate "Don't Care" when building truth tables.

end rtl;
