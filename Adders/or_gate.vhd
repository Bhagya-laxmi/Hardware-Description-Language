library IEEE;
use IEEE.std_logic_1164.all;

entity OR_GATE is
  port(
    -- add ports here
    -- port names, directions, types and order must exactly
    -- match the ports which are declared in the component OR_GATE
    -- in the testbench
    A : in std_logic;
    B : in std_logic;
    Y : out std_logic
  );
end;

architecture DATAFLOW of OR_GATE is
begin
  -- your code here
Y<=  A or B ; 
--Y<= inertial A or B after 2 ns;  
end DATAFLOW;
