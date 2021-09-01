library IEEE;
use IEEE.std_logic_1164.all;
use work.all; 

  entity Ula_teste is port (
      A,B                          : in  std_logic_vector ( 3 downto 0 );  --entradas
		selection                    : in  std_logic_vector ( 2 downto 0 ); --seletor
		cin                          : in  std_logic; --carry
		result, logic_result                   : out std_logic_vector ( 3 downto 0 ); --saida
      cout,overflow,borrow,zero,negativo  : out std_logic -- flags
);
  end Ula_teste;  
  
  architecture calcular of Ula_teste is
	signal vector_a_temp, vector_b_temp, result_soma, result_sub, result_comp_2, res_and, res_or, res_xor, res_xnor, result_t: std_logic_vector ( 3 downto 0 ); 
	signal cin_temp: std_logic;	
	
	Begin -- os "componentes" precisam ser declarados antes, visto que "não se pode incluir um componente em um hardware do nada"
		sum_i: adder_4 port map (vector_a_temp, vector_b_temp, cin_temp, result_soma, cout, overflow);
		sub_i: subtrator port map (vector_a_temp, vector_b_temp, result_sub);
		comp_2: complemento_de_2 port map(vector_a_temp, result_comp_2);
		and_i: and_1 port map(vector_a_temp, vector_b_temp, res_and);
		xnor_i: xnor_1 port map(vector_a_temp, vector_b_temp, res_xnor);
		or_i: or_1 port map(vector_a_temp, vector_b_temp, res_or);
		xor_i:xor_1 port map(vector_a_temp, vector_b_temp, res_xor);
		
		ula_selection: process (A, B, selection, cin)
		
		
		
		Begin
		-- dá A e B para os vetores temporários
		vector_a_temp <= A; 
		vector_b_temp <= B; 
		cin_temp <= cin;
		case selection is
			  
			  when "000" => -- Soma
			  result_t <= result_soma;
			  logic_result <= "0000";	
			  
			  when "001" => -- Subtração
			  result_t <= result_sub;
			  logic_result <= "0000";				 
						
			  when "010" => -- mesmo full-adder
			   vector_b_temp <= "0001";
				result_t <= result_soma;-- Incremento
				logic_result <= "0000";					  
								 
			  when "011" => -- usa o mesmo full-adder de soma
		
			  logic_result <= "0000"; 	
			  result_t <= result_comp_2;-- troca de sinal
								 
								 
			  when "100" => result_t <= "0000"; -- AND
								logic_result <= res_and;
								
			  when "101" => result_t <= "0000"; -- OR
								logic_result <= res_or;
								
			  when "110" => result_t <= "0000"; -- XOR
								logic_result <= res_xor;
								
			  when "111" => result_t <= "0000"; -- XNOR
								logic_result <= res_xnor;
								
			  when others => result_t <= "0000"; -- 
							logic_result <= "0000";
								
			  end case;
			 case result_t is 
			when "0000" =>
				zero <= '1';
			when others =>
				zero <= '0';
			end case;
		
			result <= result_t;
			
		End process ula_selection;	
		
End calcular;
					
-- Flip Flop

library IEEE;
use IEEE.std_logic_1164.all;  

   entity FlipFlopD is
     port
     (
       clk, d: in std_logic;
       q: out std_logic
      );
     end FlipFlopD;
   architecture FFD of FlipFlopD is
     begin
     process(clk)
     begin
        if clk'event and clk = '1' then
        q <= d;
        end if;
     end process;
   end FFD;
