library IEEE;
use IEEE.std_logic_1164.all;

entity XOR_GATE is
  port(
    A : in std_logic;
    B : in std_logic;
    Y : out std_logic
  );
end;

architecture STRUCTURE of XOR_GATE is
  component NAND_GATE
    port( A : in std_logic; B : in std_logic; Y : out std_logic );
  end component;

  signal C, D, E : std_logic;
begin
  N1 : NAND_GATE port map(A => A, B => B, Y => C);
  N2 : NAND_GATE port map(A => A, B => C, Y => D);
  N3 : NAND_GATE port map(A => C, B => B, Y => E);
  N4 : NAND_GATE port map(A => D, B => E, Y => Y);
end STRUCTURE;
