library IEEE;
use IEEE.std_logic_1164.all;
use work.Sudoku_package.all;

entity Sudoku_cell is

port(clk: in bit;
     Reset: in bit;
     cell_init : in integer;
     row_values : in index(7 downto 0);
     column_values : in index(7 downto 0);
     box_values: in index(3 downto 0);
     Cell_value: out std_logic_vector(9 downto 1)
     );
end entity Sudoku_cell;


architecture Cell_arch of Sudoku_cell is
begin

actual_comp:process(Reset,clk)
 variable cell_check: std_logic_vector(9 downto 1);
 variable temp_A,temp_B,temp_C,temp_D,temp_E,temp_F,temp_G,temp_H,temp_I: std_logic_vector(9 downto 1):="000000000";
 variable count_row,count_col,count_box: integer;
 variable result_row, result_col,result_box, result_final: std_logic_vector(9 downto 1):="000000000";

begin

 result_row := "000000000";
 result_col := "000000000";
 result_box := "000000000";
 result_final := "000000000";
 if( Reset = '1') then
  if( cell_init >0) then
   cell_check := Int_Vector(cell_init);
  --Cell_inter <= Int_Vector(cell_init);
  else
   cell_check := default_value;
   --Cell_inter <= default_value;
  end if;
  Cell_value <= cell_check;
 elsif( clk= '1') and ( OneCount(cell_check) >1) then
  for i in 7 downto 0 loop
   count_row := OneCount( row_values(i));
  
   if( count_row = 1) then

    temp_A  := temp_A  or row_values(i);
   end if;

   count_col := OneCount( column_values(i));
   if( count_col = 1) then
    temp_D := column_values(i) or temp_D;
   end if; 

  end loop;

  for i in 3 downto 0 loop
   count_box := OneCount( box_values(i));
   if( count_box = 1) then
    temp_G := box_values(i) or temp_G;
   end if; 
  end loop;

  temp_B := NOT temp_A;
  temp_E := NOT temp_D;
  temp_H := NOT temp_G;

  temp_C := cell_check and temp_B;
  temp_F :=  temp_C and temp_E;
  temp_I := temp_F and temp_H;
  
 loop1:for i in 9 downto 1 loop
    if temp_I(i) = '1' then
     for j in 7 downto 0 loop
      if OneCount(row_values(j)) > 1 then
       if row_values(j)(i) = '1' then
        result_row(i) := '0';
        next loop1;
       else
        result_row(i) := '1';
       end if;
      end if;
     end loop;
    end if;
   end loop;


loop2:for i in 9 downto 1 loop
    if temp_I(i) = '1' then
     for j in 7 downto 0 loop
      if OneCount(column_values(j)) > 1 then
       if column_values(j)(i) = '1' then
        result_col(i) := '0';
        next loop2;
       else
        result_col(i) := '1';
       end if;
      end if;
     end loop;
    end if;
   end loop;   

loop3:for i in 9 downto 1 loop
    if temp_I(i) = '1' then
     for j in 3 downto 0 loop
      if OneCount(box_values(j)) > 1 then
       if box_values(j)(i) = '1' then
        result_box(i) := '0';
        next loop3;
       else
        result_box(i) := '1';
       end if;
      end if;
     end loop;
    end if;
   end loop;

   result_final := result_row and result_col and result_box;
  
   if OneCount(result_final) = 1 then
    cell_check := result_final;   
   else
    cell_check := temp_I;
   end if;
 
    Cell_value <= cell_check;
 
end if;

end process actual_comp;


end architecture Cell_arch;
