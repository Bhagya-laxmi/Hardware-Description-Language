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

architecture ripple_package of ADDER is
begin

process
variable sum_plus_carry: std_logic_vector(N downto 0);
begin
 
sum_plus_carry(N downto 0) := ADD_RIPPLE(A,B,Cin);
S(N-1 downto 0) <= sum_plus_carry(N-1 downto 0);
Cout<= sum_plus_carry(N);
wait on A,B;
end process;
end architecture ripple_package;
