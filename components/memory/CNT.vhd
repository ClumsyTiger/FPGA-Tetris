library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity CNT is

	generic
	(
		wid   : natural   := 10;    --wid mora da bude vece od log2(top)!!!!!!
		top   : natural   :=  9;
	   bot   : natural   :=  0
	);

	port 
	(
		intop	   : in  std_logic_vector(wid-1 downto 0) := std_logic_vector(to_unsigned(top, wid));
		inbot	   : in  std_logic_vector(wid-1 downto 0) := std_logic_vector(to_unsigned(bot, wid));
		ldtop	   : in  std_logic := '0';
		ldbot	   : in  std_logic := '0';

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
begin

	process (clk)
		variable cnt  : natural := bot;   --broji se u intervalu [bot, top] n N0

	begin
		if (rising_edge(clk)) then
			
			if    reset  = '1' then cnt := bot;
			elsif pause /= '1' then 
				if cnt    = top then cnt := bot;
				else                 cnt := cnt + 1;
				end if;
			end if;
			
		end if;
		
		
		Icurr <= std_logic_vector(to_unsigned(cnt, wid));
		--isbeg <= '1' when cnt = bot else '0';
		--isend <= '1' when cnt = top else '0';
		
	end process;


	process (ldtop, ldbot, intop, inbot)
	begin
		
		if ldtop = '1' then top <= intop; end if;
		if ldbot = '1' then bot <= inbot; end if;

	end process;

end rtl;
