--SR flip flop
--The working of SR flipflop is as follows: if S=1, output is 1 if, R=1 output is 0 if S and R =1 the output is not specified


library IEEE;
use IEEE.std_logic_1164.all;

entity SR_flipflop is
port(S,R: in std_logic; z: out std_logic);
end SR_flipflop;

architecture SR_arch of SR_flipflop is
begin

set_reset: process(S,R)
begin
 assert (S = '1') nand (R = '1')
 report " S and R are both 1" ;
 if S = '1' then
   Z<= '1';
 elsif R= '1' then
   z<= '0';
 else
   z<= 'X';
 end if;
end process set_reset;

end SR_arch;
