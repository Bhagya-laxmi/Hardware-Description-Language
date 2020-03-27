--The main entity creates the individual cells.
use work.Sudoku_package.all;
library IEEE;
use IEEE.std_logic_1164.all;

entity Sudoku_MainEntity is
--generic(N: in integer);
 port(clk: in bit;
     Reset:in bit;
     Sudoku: in sudoku_type(0 to 8,0 to 8); --(0 to N-1,0 to N-1)
     Sudoku_out:out sudoku_type(0 to 8,0 to 8));
end entity Sudoku_MainEntity;

architecture MainEntity_arch of Sudoku_MainEntity is

signal Cell_Inter: array_vector(0 to 8,0 to 8);
begin

-- generate statements
-- check for the final value

G1:for I in 0 to 8 generate --N-1
begin
G2: for J in 0 to 8 generate --N-1
begin
  Cell_n:Sudoku_cell --generic map(N=>N)
                     port map(clk=>clk,Reset=> Reset ,cell_init=> Sudoku(I,J),
                             row_values(7)=> Cell_Inter(I,(J+8) mod 9),
                      row_values(6)=> Cell_Inter(I,(J+7) mod 9),
                      row_values(5)=> Cell_Inter(I,(J+6) mod 9),
                      row_values(4)=> Cell_Inter(I,(J+5) mod 9),
                      row_values(3)=> Cell_Inter(I,(J+4) mod 9),
                      row_values(2)=> Cell_Inter(I,(J+3) mod 9),
                      row_values(1)=> Cell_Inter(I,(J+2) mod 9),
                      row_values(0)=> Cell_Inter(I,(J+1) mod 9),
                     column_values(7)=>Cell_Inter((I+8) mod 9,J),
                     column_values(6)=>Cell_Inter((I+7) mod 9,J),
                     column_values(5)=>Cell_Inter((I+6) mod 9,J),
                     column_values(4)=>Cell_Inter((I+5) mod 9,J),
                     column_values(3)=>Cell_Inter((I+4) mod 9,J),
                     column_values(2)=>Cell_Inter((I+3) mod 9,J),
                     column_values(1)=>Cell_Inter((I+2) mod 9,J),
                     column_values(0)=>Cell_Inter((I+1) mod 9,J),
		     box_values(3)=>Cell_Inter((I-3*(I/3)+2) mod 3 + 3*(I/3),(J-3*(J/3)+2) mod 3 + 3*(J/3)),
                     box_values(2)=>Cell_Inter((I-3*(I/3)+2) mod 3 + 3*(I/3),(J-3*(J/3)+1) mod 3 + 3*(J/3)),
                     box_values(1)=>Cell_Inter((I-3*(I/3)+1) mod 3 + 3*(I/3),(J-3*(J/3)+2) mod 3 + 3*(J/3)),
                     box_values(0)=>Cell_Inter((I-3*(I/3)+1) mod 3 + 3*(I/3),(J-3*(J/3)+1) mod 3 + 3*(J/3)),
                     Cell_value(9 downto 1)=>Cell_Inter(I,J)      
);		
end generate;
end generate; 

Final_check:process(clk)
begin


  for I in 0 to 8 loop --N-1
   for J in 0 to 8 loop --N-1
    Sudoku_out(I,J) <= Vector_Int(Cell_Inter(I,J));
   end loop;
   end loop;


end process Final_check;

end architecture MainEntity_arch;
