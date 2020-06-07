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

architecture RIPPLE of ADDER is
begin

  -- your code here
  P1: process
  variable Cinter: std_logic;
  begin
    cinter := cin;
    ripple: for i in 0 to N-1 loop
      S(i) <= A(i) xor B(i) xor Cinter;
      Cinter := ((A(i) xor B(i)) and Cinter ) or ( A(i) and B(i));
    end loop ripple;
    
  Cout <= Cinter;
  
  wait on A,B,Cin;
    
  end process P1;
end RIPPLE;
