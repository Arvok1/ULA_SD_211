library ieee;
use IEEE.STD_LOGIC_1164.ALL;

-- leds ligam em 1, desligam em 0

entity leds is
       port (
             op: in std_logic_vector(2 downto 0);
             leds: out std_logic_vector(3 downto 0) := "0000"
             );
end leds;

architecture Led of leds is
begin
       with op select
            leds <=
                  "0000" when "000", --soma
                  "0001" when "001", --sub
                  "0010" when "010", --incremento
                  "0011" when "011", --troca
                  "0100" when "100", --xnor
                  "0101" when "101", --and
                  "0110" when "110", --or
                  "0111" when "111", --xor
                  "1111" when others;
end Led;

library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity flagleds is
       port (
             cout,overflow,borrow,zero,negativo: in std_logic;
             leds: out std_logic_vector(7 downto 0) := "00000000"
             );
end flagleds;

architecture FlagLed of flagleds is
begin
	
       with cout select
			leds(7) <= '1' when '1', -- led mais a esquerda da sequencia dada ao componente acenderá quando cout for verdadeiro e daí em diante
							'0' when others;
		 with overflow select
			leds(6) <= '1' when '1',
							'0' when others;
		with borrow select
			leds(5) <= '1' when '1',
							'0' when others;
		with zero select
			leds(4) <= '1' when '1',
							'0' when others;
		 with negativo select
			leds(3) <= '1' when '1',
							'0' when others;
end FlagLed;