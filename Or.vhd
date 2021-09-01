library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity Or_1 is
      PORT(
          A, B : IN std_logic_vector(3 downto 0);
          result : OUT std_logic_vector(3 downto 0)
          );
end Or_1;

architecture arq_or of Or_1 is

begin
      result <= A or B;
end arq_or;
