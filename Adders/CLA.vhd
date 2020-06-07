library IEEE;
use IEEE.std_logic_1164.all;

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


architecture adder_CLA of ADDER is
begin

 cla: process
  variable P: std_logic_vector(N-1 downto 0);
  variable G: std_logic_vector(N-1 downto 0);
  variable Carry : std_logic_vector(N downto 0);
 begin
 Carry(0) := Cin;
   loop_check: for i in 0 to N-1 loop
    P(i) := A(i) xor B(i);
    G(i) := A(i) and B(i);
    Carry(i+1) := G(i) or (P(i) and Carry(i));
    S(i) <= P(i) xor Carry(i);
   end loop loop_check;
 Cout <= Carry(N);

wait on A,B; 
 end process cla;
end architecture adder_CLA;
