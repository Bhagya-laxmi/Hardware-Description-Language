library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

Library GATES_lib;

entity TB_ADDER is
end;

architecture TESTBENCH of TB_ADDER is

  component ADDER
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
  end component;
  
 for UUT: ADDER use entity GATES_lib.ADDER(cla_package);
  signal A, B, S : std_logic_vector(7 downto 0);
  signal Cin, Cout : std_logic;

begin

  -- instance of ADDER
  UUT : ADDER generic map(8) port map(A, B, Cin, S, Cout);
  
  process
   variable valueA: integer;
   variable valueB: integer;
   
  begin
    -- your stimuli and result checks here

   valueA:=0; valueB := 0;
  loop1: for i in 0 to 255 loop
    A(7 downto 0) <= STD_LOGIC_VECTOR(TO_UNSIGNED(ValueA,8));
   loop2:for i in 0 to 255 loop
     B(7 downto 0) <= STD_LOGIC_VECTOR(TO_UNSIGNED(ValueB,8));   
     valueB := valueB+1;
     wait for 10 ns;
   end loop loop2;
   valueA:=valueA+1;
  end loop loop1;
  end process;
  
end;

