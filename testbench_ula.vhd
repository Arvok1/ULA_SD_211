 --testbench n tem entradas nem saídas
library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;
use work.all; 


entity testbench_ula is end;
architecture test of testbench_ula is
 

signal t_A, t_B, selection: std_logic_vector(3 downto 0) := "0000";
signal t_cin: std_logic := '0';
signal result_out, logic_result_out: std_logic_vector(3 downto 0);
signal cout_out, overflow_out, borrow_out, zero_out, negativo_out: std_logic;

-- Geração de estímulos
	Begin
	ula: Ula_teste port map(t_A, t_B, selection, t_cin, result_out, logic_result_out, cout_out, overflow_out, borrow_out, zero_out, negativo_out);
	
		Process
		Begin
			--números aleatórios, para mostrar o funcionamento do display
			wait for 10ns;
				t_A <= "0001";
			wait for 10ns;
				t_A <= "0010";
			wait for 10ns;
			t_A <= "0010";
			wait for 10ns;
			t_A <= "0100";
			wait for 10ns;
			t_A <= "1000";
			wait for 10ns;
			t_A <= "1011";
			
			-- soma número negativo com positivo(-7 + 2)
			wait for 10ns;
			t_A <= "1001";
			t_B <= "0010";
			
			
			-- soma com cin e número positivo com positivo(2+3+1)
			wait for 10ns;
			t_cin <= '1';
			t_A <= "0011";
			
			-- troca de sinal de A, que nesse momento ta 0011(-7) e deve ir para 7(0111)
			wait for 10ns;
			t_cin <= '0';
			selection <= "011";
			
			-- troca de sinal de 0101(5) para -5
			wait for 10ns;
			t_A <= "0101";
			
			-- AND
			wait for 10ns;
			selection <= "100";
			t_A <= "1001";
			t_B <= "0001"; --resultado tem que ser 0001
			
			-- OR
			wait for 10ns;
			selection <= "101";
			t_A <= "0110";
			t_B <= "1010"; --resultado tem que ser 1110
			
			-- XOR
			wait for 10ns;
			selection <= "110";
			t_A <= "1001";
			t_B <= "1100"; -- resultado tem que ser 0101
			
			-- Incremento de 1
			wait for 10ns;
			selection <= "010";
			t_A <= "1011";
			
			wait for 10ns;
			t_A <= "0100";
			
			--Subtração
			wait for 10ns;
			selection <= "001";
			t_A <= "0110";
			t_B <= "0011";
			
			wait for 10ns;
			t_A <= "1000";
			t_B <= "1000";
			
			wait for 10ns;
			t_B <= "1100";
			
			wait for 10ns;
			t_A <= "0100";
			t_B <= "1111";
			
		end process;
	end architecture test;