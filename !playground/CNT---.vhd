library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity CNT is

	generic
	(
		wid       : natural   := 10;    --wid mora da bude vece od log2(top_val)!!!!!!
		top_val   : natural   :=  9;
	   bot_val   : natural   :=  0;
		
		dir_val   : std_logic := '0';   -- '0':   inkrementira se   [bot .. top]   (ukljucujuci! i top: 0 1 2 3 4 5 6 7 8 9)
		                                -- '1':   dekrementira se   [top .. bot]   (ukljucujuci! i bot: 9 8 7 6 5 4 3 2 1 0)
		looop_val : std_logic := '0'    -- '0':   zaustavi se brojanje
		                                -- '1':   nastavi  se brojanje ciklicno (ponovo od pocetka)
	);

	port 
	(
		Ntop	  : in  std_logic_vector(wid-1 downto 0) := std_logic_vector(to_unsigned(top_val, wid));
		Nbot	  : in  std_logic_vector(wid-1 downto 0) := std_logic_vector(to_unsigned(bot_val, wid));
		dir     : in  std_logic := '0';
		looop   : in  std_logic := '0';
		Jcurr	  : out std_logic_vector(wid-1 downto 0);
		cyc_end : out std_logic;

		--ako nista nije ukljuceno, onda se inkrementira/dekrementira brojac
		ld	   : in  std_logic := '0';   --ako se pozove ld onda se obavezno i resetuje brojac!!!!!!
		rs	   : in  std_logic := '0';   --reset to either top_val or bot_val

		clk	: in  std_logic
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
	signal data, data_next : std_logic_vector(wid-1 downto 0) := std_logic_vector(to_unsigned( top_val when dir = '0' else bot_val, wid ));   ---------------------------------------
begin

	Jcurr <= data;

	process (clk)
	begin
		if (rising_edge(clk)) then
			data <= data_next;
		end if;
	end process;

	process (ld, rs, Ntop, Nbot, cyc_end)
	begin
		
		if    rs  then 
		elsif ld  then 
		end if;
		
	end process;

end rtl;
