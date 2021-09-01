library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use work.all;

-- Use
--
--
--
--
--
--
--
--

	entity main is
	port (
	G_CLOCK_50: in std_logic;
	V_SW: in std_logic_vector(17 downto 0);
	KEY: in std_logic_vector(3 downto 0);
	LEDR: out std_logic_vector(17 downto 0) := "000000000000000000";
	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7: out std_logic_vector(6 downto 0)
	
	);
	end main;

	architecture func of main is
	signal clk_1s: std_logic; 
	signal n1, n2, num1, num2, res, logic_res: std_logic_vector(3 downto
	0):= "0000";
	signal selec: std_logic_vector(2 downto 0);
	signal cin, en, cout, ov, borrow, zero, negativo: std_logic;
	signal ula_num1, ula_num2: std_logic_vector(3 downto 0);
	
	begin 
	n1 <= V_SW(17 downto 14);
	n2 <= V_SW(13 downto 10);
	selec <= V_SW(9 downto 7);
	cin <= V_SW(6);
	
	op_leds: leds port map(selec, LEDR(3 downto 0)); --led mostrando qual a operação atual
	calculate: Ula_teste port map(n1, n2, selec, cin, res, logic_res, cout, ov, borrow, zero, negativo); --Coloca os valores na Ula e pega de volta os resultados
	flag_leds: flagleds port map(cout,ov,borrow,zero,negativo, LEDR(11 downto 4)); --leds dos flags
	LEDR(15 downto 12) <= logic_res; --leds quando se deseja uma saída lógica
	disp_num1: display port map(n1, '1', HEX7, HEX6); --display do número 1
	disp_num2: display port map(n2, '1', HEX5, HEX4); -- display do número 2
	disp_rex: display port map(res, '1', HEX1, HEX0); -- display do resultado
	disp_sobra: display port map("0000", '0', HEX3, HEX2); -- desliga os displays que ficaram sobrando
	end func;