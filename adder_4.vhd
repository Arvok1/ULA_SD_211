	library IEEE;
use IEEE.std_logic_1164.all;  
use work.all;

  entity adder_4 is
  port(
       x,y : IN std_logic_vector(3 downto 0);
       cin : IN std_logic;
       res : OUT std_logic_vector(3 downto 0);
       cout, overflow : OUT std_logic
       );
  end adder_4;

  architecture arch_soma_4 of adder_4 is
		
	  signal temp, cin_i, cout_i : std_logic_vector (3 downto 0);
	  signal  sum_i: std_logic;
		
	begin
		 add_0: adder port map (x(0), y(0), cin, sum_i, cout_i(0));
     cin_i(0) <= cout_i(0);
     add_1: adder port map (x(1), y(1), cin_i(0), res(1),cout_i(1));
	  cin_i(1) <= cout_i(1);
     add_2: adder port map (x(2), y(2), cin_i(1), res(2),cout_i(2));
     cin_i(2) <= cout_i(2);
     add_3: adder port map (x(3), y(3), cin_i(2), res(3),cout);
     res(0) <= sum_i;
     overflow <= cout_i(2) and x(3) and y(3);
   end arch_soma_4;  
  