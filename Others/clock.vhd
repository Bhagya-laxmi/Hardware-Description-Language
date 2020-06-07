library IEEE;
use IEEE.std_logic_1164.all;
use work.byte_new.all;

entity CLOCK is

 generic ( period : time := 20 ns; dutycycle : DC :=0.6);
 port (outport : out std_logic);
  
end;

architecture ClkPort of CLOCK is

begin
	
outport <= '0' , '1' after (1.0- dutycycle)* period, '0' after (period+ (1.0- dutycycle)* period);
end ClkPort;
