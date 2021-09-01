library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity And_1 is
      PORT(
            A, B : IN std_logic_vector(3 downto 0);
            result : OUT std_logic_vector(3 downto 0)
          );
end And_1;

architecture arq_and of And_1 is

begin
       result <= A and B;
end arq_and;