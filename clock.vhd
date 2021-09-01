library ieee;
use IEEE.STD_LOGIC_1164.ALL;
	entity clock is
		port (
		clk: in std_logic;
		clk_1s: out std_logic
		);
		end clock;
	
	architecture behav of clock is
		signal signals: std_logic;
			begin
				process (clk)
				variable i: integer := 0;
					begin
					if(clk= '1') then
					if(i = 50_000_000) then
					i := 0;
					else
			i := i + 1;
			end if;
				if(i < 25_000_000) then
					clk_1s <= '0';
				else
					clk_1s <= '1';
				end if;
				end if;
				
				end process;
	end behav;