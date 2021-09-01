library IEEE
use IEEE.std_logic.1164.all;  

  entity ULA is port (
      A,B                          : in  std_logic_vector ( 3 downto 0 );  --entradas
		selection                    : in  std_logic_vector ( 2 downto 0 ); --seletor
		cin                          : in  std_logic; --carry
		result                       : out std_logic_vector ( 3 downto 0 ); --saida
      cout,overflow,zero,negativo  : out std_logic; -- flags
);
  end ULA;  
  
  architecture calcular of ULA is
  
	
	
	process (A,B,selection)
	
	begin
	     case selection is 
		  
		  when "000" =>   -- adicao
	     when "001" => 	-- Subtracao
					       
					
		  when "010" => -- Incremento
		                 
							 
		  when "011" => -- troca de sinal
		                
							 
		  when "100" => result_i <= A XNOR B;
		  when "101" => result_i <= A AND B;
		  when "110" => result_i <= A OR B;
		  when "111" => result_i <= A XOR B;
		  when others =>
		  end case;	  
	end process;
	
	zero <= '1' when result(3 downto 0) = "0000" else '0'; --zero flag
	
	result <= result_i(3 downto 0); 
	-- bits do resultado result
	
	cout <= result_i(4); 
	-- bit 4 é o carry-out
	
	overflow <= --Se os sinais de entrada forem iguais e o resultado diferente houve overflow
	             '1' when (A_i(3)=B_i(3) and A_i(3)/=Ci(3)) else '0'; 

	      
end calcular;
					
-- Flip Flop

library IEEE
use IEEE.std_logic.1164.all;  

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

--Somador 	

library ieee;
use ieee.std_logic_1164.all;

  entity adder is
    port(
      a,b,cin :IN std_logic;
      soma, cout: OUT std_logic
      );
    end adder;

  architecture soma of adder is
  begin
     soma <= a xor b xor cin;
     carry <= (a and b) or (a and cin) or (b and cin);
  end architecture;

-- Somador4bits 

library IEEE
use IEEE.std_logic.1164.all;  

  entity adder_4 is
  port(
       x,y : IN std_logic_vector(3 downto 0);
       cin : IN std_logic;
       res : OUT std_logic_vector(3 downto 0);
       cout, overflow : OUT std_logic;
       );
  end adder_4;

  architecture arch_soma of adder_4 is
     signal cout_i, cin_i : std_logic_vector(3 downto 0);
     signal sum_i : std_logic;
     component somador
     port(
        a,b,cin :IN std_logic;
        soma, cout: OUT std_logic
        );
     end component somador;
   begin                   
     add_0: somador port MAP (x(0), y(0), cin, sum_i, cout(0));
     cin_i(0) <= cout_i(0);
     add_1: somador PORT MAP (x(1), y(1), cin(0), res(1),cout(1));
	  cin_i(1) <= cout_i(1);
     add_2: somador PORT MAP (x(2), y(2), cin(1), res(2),cout(2));
     cin_i(2) <= cout_i(2);
     add_3: somador PORT MAP (x(3), y(3), cin(2), res(3),cout;
     res(0) <= sum_i;
     overflow <= cout(2) and x(3) and y(3);
   end architecture;  
  
  
  
-- Subtrator

library IEEE
use IEEE.std_logic.1164.all;  

   entity subtrator is
     port(
        x, y : IN std_logic_vector(3 downto 0);
        sub : OUT std_logic_vector(3 downto 0);
        vaium : OUT std_logic
      );
     end subtrator;
   architecture arch_sub of sub is
       signal cin : std_logic := '1';
       signal x_i, y_i : std_logic_vector( 3 downto 0);
       signal cout, ov : std_logic;
   component somador4 is
      port(
         x, y : out std_logic_vector( 3 downto 0);
         cin :  out std_logic;
         res :  out std_logic_vector(3 downto 0);
         cout, overflow : out std_logic;
          );
   end component somador4 ;
   begin
      subtr: somador4 Port Map (x_i, y_i, cin, res, cout, overflow);
      sub: process(x,y)
   begin
      if(y > x) then
        vaium <= '1';
        x_i <= y;
        y_i <= not x;
      else
        x_i <= x;
        y_i <= not y;
        vaium <= '0';
      end if;
   end process sub;
  end arch_sub4;








  
  