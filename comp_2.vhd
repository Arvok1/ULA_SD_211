LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use work.all;  

	entity complemento_de_2 is
		port(
			entrada: IN std_logic_vector(3 downto 0);
			entrada_invertida: OUT std_logic_vector(3 downto 0)
		);
		end complemento_de_2;
		
		
	architecture troca_sinal of complemento_de_2 is
		signal tempx_i: std_logic_vector(3 downto 0);
		signal c2x_i: std_logic_vector(3 downto 0);
		signal one: std_logic_vector(3 downto 0):= "0001";
		signal cin: std_logic := '0';
		signal cout, ov: std_logic;
	

	begin 
		tempx_i <= not entrada;
		soma_1: adder_4 port map(tempx_i, one, cin, entrada_invertida, cout, ov);
	end troca_sinal;
