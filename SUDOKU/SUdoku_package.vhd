--Package for Sudoku consisting of type declarations

library IEEE;
use IEEE.std_logic_1164.all;

package Sudoku_package is
 
 constant default_value: std_logic_vector(9 downto 1):= "111111111";
 type array_vector is array (integer range <>, integer range <>) of std_logic_vector(9 downto 1);
 type sudoku_type is array (integer range <>, integer range <>) of integer range 0 to 9;
 
 type index is array ( integer range <>) of std_logic_vector(9 downto 1);

 function Int_Vector(A: in integer) return std_logic_vector;
 function Vector_Int(A: in std_logic_vector) return integer; 
 function OneCount(A: in std_logic_vector) return integer; 

 
component Sudoku_cell 
  port(clk: in bit;
     Reset: in bit;
     cell_init : in integer;
     row_values : in index(7 downto 0);
     column_values : in index(7 downto 0);
     box_values: in index(3 downto 0);
     Cell_value: out std_logic_vector(9 downto 1)
     );
  end component Sudoku_cell;
end package Sudoku_package;

package body Sudoku_package is

function Int_Vector(A: in integer) return std_logic_vector is
 variable inter_value: std_logic_vector(9 downto 1);
begin
 case A is 
  when 1 =>
   inter_value := "000000001" ;
  when 2 =>
   inter_value := "000000010" ;
  when 3 =>
   inter_value := "000000100" ;
  when 4 =>
   inter_value := "000001000";
  when 5 =>
   inter_value := "000010000" ;
  when 6 =>
   inter_value := "000100000" ;
  when 7 =>
   inter_value := "001000000" ;
  when 8 =>
   inter_value := "010000000";
  when 9 =>
   inter_value := "100000000";
  when others =>
   inter_value := "XXXXXXXXX" ;
end case;

return inter_value;
end function;

function Vector_Int(A: in std_logic_vector) return integer is
 variable temp:integer;
begin
temp:= 0;
 loop1:for i in A'right to A'left loop
  if (A(i) = '0') then
    temp := temp+1;
 elsif(A(i) ='1') then
   temp := temp+1;
   exit loop1;
 end if;
end loop;

return temp;
end function;

function OneCount(A: in std_logic_vector) return integer is
 variable temp:integer;
begin
 temp := 0;
 for i in A'right to A'left loop
  if (A(i) = '1') then
    temp := temp +1;
 end if; 
 end loop;

return temp;
end function;


end package body;
