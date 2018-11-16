library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SEVEN_SEG is

	port
	(
		x	 : in  std_logic_vector(3 downto 0) := (others => '0');   --broj 0-15
		dot : in  std_logic := '0';                                  --decimalna tacka
		z	 : out std_logic_vector(7 downto 0);                      --abcdefg & dp
		
		en  : in  std_logic := '0'
	);

end entity;

architecture rtl of SEVEN_SEG is
	signal dp : std_logic := '0';
begin
	
	process (en, x, dp) is
	begin
		if en = '1' then
			case x is
				--					      abcdefg    dp
				when "0000" => z <= "0000001" & dp;   -- #0
				when "0001" => z <= "1001111" & dp;   -- #1
				when "0010" => z <= "0010010" & dp;   -- #2
				when "0011" => z <= "0000110" & dp;   -- #3
				when "0100" => z <= "1001100" & dp;   -- #4
				when "0101" => z <= "0100100" & dp;   -- #5
				when "0110" => z <= "0100000" & dp;   -- #6
				when "0111" => z <= "0001111" & dp;   -- #7
				when "1000" => z <= "0000000" & dp;   -- #8
				when "1001" => z <= "0000100" & dp;   -- #9

				when "1010" => z <= "0001000" & dp;   -- #A
				when "1011" => z <= "1100000" & dp;   -- #B
				when "1100" => z <= "0110001" & dp;   -- #C
				when "1101" => z <= "1000010" & dp;   -- #D
				when "1110" => z <= "0110000" & dp;   -- #E
				when "1111" => z <= "0111000" & dp;   -- #F

				when others => z <= "1111111" & '1';   -- #else
			end case;
		else
				               z <= "1111111" & '1';   -- #else
		end if;
		 
	end process;

	dp <= not dot;
	
end rtl;

