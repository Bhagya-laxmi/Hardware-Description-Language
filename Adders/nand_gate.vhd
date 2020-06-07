library IEEE;
use IEEE.std_logic_1164.all;

entity NAND_GATE is
  port(
    A : in std_logic;
    B : in std_logic;
    Y : out std_logic
  );
end;

architecture DATAFLOW of NAND_GATE is
begin
  -- your code here
with not( A and B) select Y <= transport

  '1' after 2 ns when '1',
  '0' after 1 ns when '0',
  'X' when others;
end DATAFLOW;
