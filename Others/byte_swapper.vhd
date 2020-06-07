--Byte swapper module
--Module with one input and one output port that swaps 2 bytes of the input with each other.


use work.byte_new.all;


entity byte_swapper is
port( byte_input: in halfword; byte_output: out halfword);
end byte_swapper;

architecture swapper_arch of byte_swapper is
begin

swap: process(byte_input)
begin

 byte_output(8 to 15) <= byte_input(0 to 7);
 byte_output(0 to 7) <= byte_input(8 to 15); 

end process swap;

end swapper_arch;
