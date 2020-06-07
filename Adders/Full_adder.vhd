Library IEEE;
use IEEE.std_logic_1164.all;

entity FAStruct is
port(A: in std_logic;
     B: in std_logic;
     Cin: in std_logic; 
     Sum: out std_logic; 
     Cout: out std_logic );
end entity FAStruct;

architecture struct_fa of FAStruct is 
component TWO_INPUT_GATE is
port( a:in std_logic;
      b:in std_logic;
      y:out std_logic);
end component TWO_INPUT_GATE;

for xorgate1, xorgate2: TWO_INPUT_GATE use entity work.XOR_GATE(STRUCTURE);
for andgate1,andgate2 : TWO_INPUT_GATE use entity work.AND_GATE(DATAFLOW);
for orgate : TWO_INPUT_GATE use entity work.OR_GATE(DATAFLOW);

Signal Y1,Y2,Y3:std_logic;

begin

xorgate1: component TWO_INPUT_GATE port map(a=>A,b=>B,y=>Y1);
xorgate2: component TWO_INPUT_GATE port map(a=>Y1,b=>Cin,y=>Sum);
andgate1: component TWO_INPUT_GATE port map(a=>Y1,b=>Cin,y=>Y2);
andgate2: component TWO_INPUT_GATE port map(a=>A,b=>B,y=>Y3);
orgate: component TWO_INPUT_GATE port map(a=>Y2,b=>Y3,y=>Cout);


end architecture struct_fa;
