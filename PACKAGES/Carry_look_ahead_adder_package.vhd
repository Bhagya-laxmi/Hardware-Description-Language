library IEEE;
use IEEE.std_logic_1164.all;
Library MATH_LIB;
use MATH_LIB.addition_pack.all;

entity ADDER is
  -- your generics and ports here
  generic(
      N : in NATURAL
    );
    port(
      A : in std_logic_vector(N-1 downto 0);
      B : in std_logic_vector(N-1 downto 0);
      Cin : in std_logic;
      S : out std_logic_vector(N-1 downto 0);
      Cout : out std_logic
    );
end;

architecture cla_package of ADDER is
begin

process(A,B)
begin
ADD_LOOKAHEAD(A,B,Cin,S,Cout);
end process;

end architecture cla_package;
