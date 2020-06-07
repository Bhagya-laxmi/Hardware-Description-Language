library IEEE;
use IEEE.std_logic_1164.all;

entity TB_XOR is
end;

architecture TESTBENCH of TB_XOR is

  component XOR_GATE
    port( A : in std_logic; B : in std_logic; Y : out std_logic );
  end component;

  signal A, B   : std_logic; -- inputs to the three gates
  signal Y_XOR  : std_logic; -- output from XOR gate
  
begin

  I_XOR : XOR_GATE port map(A => A, B => B, Y => Y_XOR); -- instance of XOR gate
    
  process
  begin
    -- write your stimuli here
    A <= transport '0', '1' after 1 ns, '0' after 2 ns;
    b <= transport '0','1' after 2 ns, '0' after 3 ns;
    wait; -- when all stimuli have been applied, wait forever
    wait; -- when all stimuli have been applied, wait forever
  end process;
  
end TESTBENCH;
