library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity Xor_1 is
         port(
              A, B : IN std_logic_vector(3 downto 0);
              result : OUT std_logic_vector(3 downto 0)
             );
end Xor_1;

architecture arq_xor of Xor_1 is

begin
      result <= A xor B;
end arq_xor;
