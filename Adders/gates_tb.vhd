library IEEE;
use IEEE.std_logic_1164.all;

entity TB_3GATES is
end;

architecture TESTBENCH of TB_3GATES is

  component OR_GATE
    port( A : in std_logic; B : in std_logic; Y : out std_logic );
  end component;
  component AND_GATE
    port( A : in std_logic; B : in std_logic; Y : out std_logic );
  end component;
  component NAND_GATE
    port( A : in std_logic; B : in std_logic; Y : out std_logic );
  end component;
  
  signal A, B   : std_logic; -- inputs to the three gates
  signal Y_OR   : std_logic; -- output from OR gate
  signal Y_AND  : std_logic; -- output from AND gate
  signal Y_NAND : std_logic; -- output from NAND gate
  
begin

  I_OR : OR_GATE port map(A => A, B => B, Y => Y_OR); -- instance of OR gate
  I_AND : AND_GATE port map(A => A, B => B, Y => Y_AND); -- instance of AND gate
  I_NAND : NAND_GATE port map (A => A, B => B, Y => Y_NAND); -- instance of NAND gate
  
  process
  begin
    -- write your stimuli here
    A <= transport '0', '1' after 1 ns, '0' after 2 ns;
    b <= transport '0','1' after 2 ns, '0' after 3 ns;
    wait; -- when all stimuli have been applied, wait forever
  end process;
  
end TESTBENCH;
