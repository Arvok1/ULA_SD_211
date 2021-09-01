library IEEE;
use IEEE.std_logic_1164.all;  

	entity adder is
    port(
      a,b,cin :IN std_logic;
      soma, cout: OUT std_logic
      );
	end adder;
	 
  architecture soma of adder is
	  begin
		  soma <= a xor b xor cin;
		  cout <= (a and b) or (a and cin) or (b and cin);
	end soma;
 