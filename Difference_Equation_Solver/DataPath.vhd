entity DataPath is
  port(
      CLK: in BIT;      -- clock signal
      RESET_IN: in BIT;
      X0 : in INTEGER;  -- start value for X
      Y0 : in INTEGER;  -- start value for Y
      U0 : in INTEGER;  -- start value for U
      DX : in INTEGER;  -- X increment
      A  : in INTEGER;  -- limit for X
      Xi : out INTEGER; -- current value of X on the curve
      Yi : out INTEGER ; -- current value of Y on the curve
      Sel_mux1,Sel_mux2,Sel_mux3,Sel_mux4,Sel_mux5,Sel_mux6,add_sub: in INTEGER;
      Reg_t3,Reg_t6,Reg_y,Reg_x1,Reg_x,Reg_u,Reg_t5: in INTEGER;
      c: out INTEGER
      );
end entity DataPath;

architecture arch_DataPath of DataPath is
type states is (St1,St2,St3,St4);

Signal t3,t5,t6:INTEGER;
Signal u,x,y,y1,x1: INTEGER;

begin

module1: process(clk)
begin

  if ( clk= '1') and(Sel_mux5 = 0)and (Sel_mux6 = 0) and ( Reg_t3 = 1)  then

   --t3<= S5 * S6;
   --t3<= Sout_mult1;
   t3 <= y * dx;
  elsif ( clk= '1')and(Sel_mux5 = 1)and (Sel_mux6 = 1) and ( Reg_t3 = 1) then

   --t3<= S5 * S6;
   --t3<= Sout_mult1;
   t3 <= 3* t3;
  end if;

        
end process module1;
 
 
module2:process(clk) 
begin

   if ( clk= '1') and (Sel_mux4 = 0)and (Sel_mux3 = 0)and ( Reg_t6 = 1) then

   t6<= u* dx;
   --t6<= Sout_mult2;
  elsif ( clk= '1') and (Sel_mux4 = 1) and (Sel_mux3 = 1) and ( Reg_t6 = 1) then

   t6<= x* t6;
   --t6<= Sout_mult2;
  elsif ( clk= '1') and (Sel_mux4 = 2)and (Sel_mux3 = 2) and ( Reg_t6 = 1) then

   t6<= 5*t6;
   --t6<= Sout_mult2;,
  end if;

end process module2;

module3:process(RESET_IN,clk) --x,y,u,t5,dx
begin
 if(RESET_IN = '0') then
  y <= Y0;
  x <= X0;
  u <= U0;

  elsif (clk='1') and(Sel_mux1 = 0)and (Sel_mux2 = 0) and (add_sub =1) and ( Reg_x1 = 1) then

   x1 <= x+dx;
  elsif (clk='1')  and (Sel_mux1 =1)and (Sel_mux2 =1)and (add_sub =1) and ( Reg_y = 1) then

   y <= t6 +y;
  elsif (clk='1')  and(Sel_mux1 = 2) and(Sel_mux2 = 2)and (add_sub =0) and ( Reg_t5 = 1)then

   t5<= u-t3;
  elsif (clk='1')  and(Sel_mux1 = 3)and (Sel_mux2 = 3)and (Reg_u = 1) and (Reg_x = 1)  then

   u <= t5-t6;
   x <= x1;
  end if;
 
end process module3; 

comp:process(clk)
begin
  if(clk = '1') then
   if( x1 < A) then
    c<= 1;
   else 
    c<= 0;
   end if;
  end if;
end process comp;

--exit_proc:process(clk,exit_flag)
--begin
-- if( exit_flag = 1) and (clk = '1') then
--  Xi <= x;
--  Yi <= y;
-- end if;
--end process exit_proc;

Xi <= x when (x1 < A);

Yi <= y when (x1 < A);

end architecture arch_DataPath;
 
 


