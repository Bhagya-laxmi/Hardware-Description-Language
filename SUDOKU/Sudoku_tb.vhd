-- Sudoku testbench

use work.Sudoku_package.all;
library IEEE;
use IEEE.std_logic_1164.all;


entity sudoku_tb is
end entity sudoku_tb;

architecture sudokuTB_arch of sudoku_tb is

 component Sudoku_MainEntity
   --generic(N: in integer);
   port(clk: in bit;
     Reset:in bit;
     Sudoku: in sudoku_type(0 to 8,0 to 8); --(0 to N-1,0 to N-1)
     Sudoku_out:out sudoku_type(0 to 8,0 to 8)); --(0 to N-1,0 to N-1)
 end component;

signal sudoku_tb_in: sudoku_type(0 to 8,0 to 8);
signal sudoku_tb_out: sudoku_type(0 to 8,0 to 8);
signal clk, Reset: BIT;
begin

CLK_GEN : process(Clk)
  begin
    if NOW < 10000 NS then 
      Clk <= not Clk after 30 ns;
    end if;
 end process;

DUT: Sudoku_MainEntity --generic map(9)
                     port map(clk,Reset,sudoku_tb_in,sudoku_tb_out);

Stimuli:process
begin
 sudoku_tb_in <= ((0,0,0,9,0,0,5,4,7),
                  (1,0,0,3,0,5,0,6,0),
                  (0,0,0,2,0,0,8,0,0),
                  (6,8,5,0,0,0,0,0,1),
                  (0,1,0,8,3,4,0,5,0),
                  (4,0,0,0,0,0,2,8,9),
                  (0,0,1,0,0,2,0,0,0),
                  (0,2,0,4,0,8,0,0,5),
                  (7,6,4,0,0,3,0,0,0));
      


wait for 2 ns;
 Reset<= '0';
wait for 5 ns;                  
 Reset<= '1';
wait for 10 ns;

Reset<= '0';
wait;
end process Stimuli;

end architecture sudokuTB_arch;
