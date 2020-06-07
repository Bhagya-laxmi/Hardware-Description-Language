library IEEE;
use IEEE.std_logic_1164.all;

entity AND_GATE is
  port(
    A : in std_logic;
    B : in std_logic;
    Y : out std_logic
  );
end;

architecture DATAFLOW of AND_GATE is
begin
  -- your code here
  Y <= A and B ;
--Y <= reject 1 ns inertial A and B after 3 ns;
end DATAFLOW;
