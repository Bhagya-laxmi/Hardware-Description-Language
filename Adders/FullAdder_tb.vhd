library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity TB_FA is
end;

architecture TESTBENCH of TB_FA is

  signal STIMULUS : std_logic_vector(2 downto 0);
  signal S, Cout  : std_logic;

  component FA
    port(
      A : in std_logic;
      B : in std_logic;
      Cin : in std_logic;
      Sum : out std_logic;
      Cout : out std_logic
    );
  end component;

for DUT: FA use entity work.FAStruct;
begin
  
  DUT : FA port map( A => STIMULUS(2),
                     B => STIMULUS(1),
                     Cin => STIMULUS(0),
                     Sum => S,
                     Cout => Cout );
  
  STIM : process
  begin
    for i in 0 to 7 loop
      STIMULUS <= STD_LOGIC_VECTOR(TO_UNSIGNED(i,3));
      wait for 20 ns;
      assert (S = (STIMULUS(0) xor STIMULUS(1) xor STIMULUS(2))) 
            and (Cout = (((STIMULUS(2) xor STIMULUS(1)) and STIMULUS(0))
                        or (STIMULUS(2) and STIMULUS(1))))
        report "full adder response is wrong"
        severity WARNING;
    end loop;
    wait;
  end process;
  
end TESTBENCH;
