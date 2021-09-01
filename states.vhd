library ieee;
use ieee.std_logic_1164.all;
entity estados is
	port (
	clk_1s, reset_key, set_key: in std_logic;
	states: out std_logic_vector(3 downto 0)
	) ;
	end estados;
	architecture arch_estados of estados is
		type states_type is (S0, S1, S2, S3, S4, S5, S6, S7, S8);
		signal myState: states_type;
		signal set, reset: std_logic;
			begin
				change_states: process(clk_1s)
				variable prev_set, prev_reset: std_logic:='1';
					begin
						if clk_1s'event and clk_1s='1' then
							if (reset /= prev_reset) then
								myState <= S0;
								states <= "0000"; -- estado para trocar número
								prev_reset := reset;
								elsif (set /= prev_set) then
									myState <= S1;
									states <= "0001";
									prev_set := set;
								else
									case myState is
									when S0 =>
										myState <= S0;
										states <= "0000";
									when S1 =>
										myState <= S2;
										states <= "0010";
									when S2 =>
										myState <= S3;
										states <= "0011";
									when S3 =>
										myState <= S4;
										states <= "0100";
									when S4 =>
										myState <= S5;
										states <= "0101";
									when S5 =>
										myState <= S6;
										states <= "0110";
									when S6 =>
										myState <= S7;
										states <= "0111";
									when S7 =>
										myState <= S8;
										states <= "1000";
									when others =>
										states <= "0001";
										myState <= S1;
									end case;
								end if;
							end if;
						end process change_states;
	receber_keys: process (reset_key, set_key)
	begin
		if reset_key ='0' then
			reset <= not reset;
			elsif set_key ='0' then
			set <= not set;
			end if;
		end process receber_keys;
	end arch_estados;