library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_adder_structural is
end entity;

architecture adder_structuralTB of tb_adder_structural is
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
  
 for DUT: ADDER use entity work.ADDER(struct_CRA);
 for REF: ADDER use entity work.ADDER(ripple);

  signal A1, B1, S1,S2 : std_logic_vector(7 downto 0);
  signal Cin, Cout1 : std_logic;
  signal Cout2 : std_logic;

begin

  -- instance of ADDER
  DUT : ADDER generic map(8) port map(A=>A1,B=> B1,Cin=> Cin,S=> S1,Cout=> Cout1);
  REF : ADDER generic map(8) port map(A=>A1,B=> B1,Cin=> Cin,S=> S2,Cout=> Cout2);

process
   variable valueA: integer;
   variable valueB: integer;
   
  begin
    -- your stimuli and result checks here

   valueA:=0; valueB := 0;
  loop1: for i in 0 to 7 loop
    A1(7 downto 0) <= STD_LOGIC_VECTOR(TO_UNSIGNED(ValueA,8));
   loop2:for i in 0 to 7 loop
     B1(7 downto 0) <= STD_LOGIC_VECTOR(TO_UNSIGNED(ValueB,8));
   wait for 100 ns;
 
assert (S1 = S2)
        report "full adder response is wrong"
        severity WARNING;
 

      valueB := valueB+1;
   end loop loop2;
   valueA:=valueA+1;
  end loop loop1;
  end process;

end architecture;
