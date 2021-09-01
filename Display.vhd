 -- Display

library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity display is

port (
       num: in std_logic_vector(3 downto 0);
		 en: in std_logic;
       D1, D2: out std_logic_vector(6 downto 0)
      );
end display;

architecture arq_display of display is
      signal dis1, dis2: std_logic_vector(6 downto 0);
begin
      with num select
					dis1 <= 
									"0111111"	when			"1000",--menos 8
									"0111111"	when			"1001",--menos 7
									"0111111"	when			"1010",--menos 6
									"0111111"	when			"1011",--menos 5
									"0111111"	when			"1100",--menos 4
										"0111111" when			"1101",--menos 3
									"0111111"	when			"1110",--menos 2
									"0111111"	when			"1111",--menos 1
									"1111111" when others;
		with num select 
              dis2 <= "1000000" when "0000",--0
                      "1111001" when "0001",--1
                      "0100100" when "0010",--2
                      "0110000" when "0011",--3
                      "0011001" when "0100",--4
                      "0010010" when "0101",--5
							 "0000010" when "0110",--6
								"1111000"		when		"0111",--7
									"0000000"	when			"1000",--menos 8
									"1111000"	when			"1001",--menos 7
									"0000010"	when			"1010",--menos 6
									"0010010"	when			"1011",--menos 5
									"0011001"	when			"1100",--menos 4
										"0110000" when			"1101",--menos 3
									"0100100"	when			"1110",--menos 2
									"1111001"	when			"1111",--menos 1
										"1111111" when others;
		
		with en select
        D1(6 downto 0) <= dis1 when '1', 
									"1111111" when '0';
		with en select
			D2(6 downto 0) <= dis2 when '1',
									"1111111" when '0';
end arq_display;
