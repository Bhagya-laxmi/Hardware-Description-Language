library IEEE;
use IEEE.std_logic_1164.all;


package ADDITION_pack is

 function ADD_RIPPLE(A,B:  std_logic_vector;Cin:  std_logic) return std_logic_vector ;

procedure ADD_LOOKAHEAD(A: in std_logic_vector;
                    B: in std_logic_vector;
                    Cin: in std_logic;signal Sum:out std_logic_vector;signal Cout: out std_logic) ;
end package ADDITION_pack;

 
package body ADDITION_pack is
function ADD_RIPPLE(A,B: std_logic_vector;Cin:  std_logic) return std_logic_vector is

variable Sum: std_logic_vector(A'left+1 downto A'right);
variable Cinter: std_logic;
begin

Cinter := Cin;
    ripple: for i in A'right to A'left loop
      Sum(i) := A(i) xor B(i) xor Cinter;
      Cinter := ((A(i) xor B(i)) and Cinter ) or ( A(i) and B(i));
    end loop ripple;
 Sum(A'left + 1) :=  Cinter ; 
 return Sum;
end function;

procedure ADD_LOOKAHEAD(A: in std_logic_vector;
                     B: in std_logic_vector;
                   Cin: in std_logic;signal Sum:out std_logic_vector;signal  Cout:out std_logic) is 

variable P: std_logic_vector(A'left downto A'right);
variable G: std_logic_vector(A'left downto A'right);
variable Carry : std_logic_vector((A'left+1) downto A'right);

begin
 Carry(0) := Cin;
   loop_check: for i in A'right to A'left loop
    P(i) := A(i) xor B(i);
    G(i) := A(i) and B(i);
    Carry(i+1) := G(i) or (P(i) and Carry(i));
    Sum(i) <= P(i) xor Carry(i);
   end loop loop_check;

 Cout <= Carry(A'left +1);
end procedure;


end package body ADDITION_pack;
