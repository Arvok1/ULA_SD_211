library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity Xnor_1 is
           PORT(
                A, B : IN std_logic_vector(3 downto 0);
                result : OUT std_logic_vector(3 downto 0)
                );
end Xnor_1;

architecture arq_xnor of Xnor_1 is

begin
         result <= A xnor B;
end arq_xnor;