LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use work.all;  

   entity subtrator is
     port(
        x, y : IN std_logic_vector(3 downto 0);
        res : OUT std_logic_vector(3 downto 0);
		  borrow: OUT std_logic
      );
     end subtrator;
   architecture arch_sub of subtrator is
       signal cin : std_logic := '0';
       signal x_i, y_i, yinvertido_i : std_logic_vector( 3 downto 0);
       signal cout, ov : std_logic;
		 
   begin
		inversor: complemento_de_2 port map(y, yinvertido_i);
      subtr: adder_4 port map (x_i, yinvertido_i, cin, res, cout, ov);
  end arch_sub;