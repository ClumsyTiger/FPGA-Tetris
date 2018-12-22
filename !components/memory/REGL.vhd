library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity REGL is

	generic
	(
		wid     : natural := 10;
		def_val : natural := 0
	);

	port 
	(
   	--POLYNOMIAL'range
   	--POLYNOMIAL'length
	
		Din	: in  std_logic_vector(wid-1 downto 0) := (others => '0');
		Dout	: out std_logic_vector(wid-1 downto 0);
		zeros : out std_logic;
		ones  : out std_logic;
		ld	   : in  std_logic := '0';
		cl	   : in  std_logic := '0';

		clk	: in  std_logic
	);

end entity;

architecture rtl of REGL is
	signal data, data_next : std_logic_vector(wid-1 downto 0) := std_logic_vector(to_unsigned( def_val, wid ));
begin
	Dout  <= data;
	zeros <= '1' when data   = 0 else '0';
	ones  <= '1' when data+1 = 0 else '0';
	
	process (clk)
	begin
		if (rising_edge(clk)) then
			data <= data_next;
		end if;

	end process;

	--realno ne bi moralo da se pise Din, data i Bin u sensitivity list-u, ali se pise jer bi ih kompajler ukljucio sam u zavisnosti od situacije,
	--sto moze a i ne mora da dovede do razlike izmedju funkcionalnosti simuliranog koda i koda koji radi na pravom hardveru
	process (Din, data, ld, cl)
	begin
		if    cl  = '1' then data_next <= (others => '0');
		elsif ld  = '1' then data_next <= Din;
		else                 data_next <= data;
		end if;
		
	end process;

end rtl;
