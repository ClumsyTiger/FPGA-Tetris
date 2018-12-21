library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity CNT is

	generic
	(
		wid   : natural   := 10;    --wid mora da bude vece od log2(top)!!!!!!
		top   : natural   :=  9;
	   bot   : natural   :=  0;
		
		incs  : std_logic := '1';   -- '0':   inkrementira se   [bot .. top]   (ukljucujuci! i top: 0 1 2 3 4 5 6 7 8 9)
		                            -- '1':   dekrementira se   [top .. bot]   (ukljucujuci! i bot: 9 8 7 6 5 4 3 2 1 0)
		loops : std_logic := '1'    -- '0':   zaustavi  se brojanje kad se dodje do kraja
		                            -- '1':   nastavlja se brojanje ciklicno
	);

	port 
	(
		ldtop	   : in  std_logic_vector(wid-1 downto 0) := std_logic;
		intop	   : in  std_logic_vector(wid-1 downto 0) := std_logic_vector(to_unsigned(top, wid));
		ldbot	   : in  std_logic_vector(wid-1 downto 0) := std_logic;
		inbot	   : in  std_logic_vector(wid-1 downto 0) := std_logic_vector(to_unsigned(bot, wid));
		
		ldincs	: in  std_logic_vector(wid-1 downto 0) := std_logic;
		inincs	: in  std_logic_vector(wid-1 downto 0) := std_logic;
		ldloops	: in  std_logic_vector(wid-1 downto 0) := std_logic;
		inloops	: in  std_logic_vector(wid-1 downto 0) := std_logic;

		Icurr    : out std_logic_vector(wid-1 downto 0);
		isbeg    : out std_logic;
		isend    : out std_logic;

		clk	   : in  std_logic;

		reset	   : in  std_logic := '0';   --resetuje brojac na pocetnu vrednost
		pause    : in  std_logic := '0'    --pauzira brojanje
	);

end entity;


-- =============================================================================
-- Choices may not overlap

-- case INT_A is
--   when 0      =>  Z <= A;
--   when 1 to 3 =>  Z <= B;
--   when 2|6|8  =>  Z <= C;   -- illegal
--   when others =>  Z <= 'X';
-- end case;
-- =============================================================================




architecture rtl of CNT is
	signal data, data_next : std_logic_vector(wid-1 downto 0) := std_logic_vector(to_unsigned( top when incs = '1' else bot, wid ));
begin

	Icurr <= data;

	process (clk)
	begin
		if (rising_edge(clk)) then
			data <= data_next;
		end if;
	end process;

	process (ldtop, ldbot, ldincs, ldloops, intop, inbot, inincs, inloops)
	begin
		
		if ldtop   then top   = intop    end if;
		if ldbot   then bot   = inbot    end if;
		if ldincs  then incs  = inincs   end if;
		if ldloops then loops = inloops  end if;

	end process;
	
	process (top, bot, incs, loops, Icurr, isbeg, isend, reset, pause)
	begin
		
	end process;

end rtl;
