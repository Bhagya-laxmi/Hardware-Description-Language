

entity DIFF_EQ_SOLVER is
  port(
    CLK: in BIT;      -- clock signal
    RESET_N : in BIT; -- active low asynchronous reset signal
    X0 : in INTEGER;  -- start value for X
    Y0 : in INTEGER;  -- start value for Y
    U0 : in INTEGER;  -- start value for U
    DX : in INTEGER;  -- X increment
    A  : in INTEGER;  -- limit for X
    Xi : out INTEGER; -- current value of X on the curve
    Yi : out INTEGER  -- current value of Y on the curve
  );
end;

architecture structural of DIFF_EQ_SOLVER is

component datapath_module
port(CLK: in BIT;      -- clock signal
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

      c: out INTEGER);
    end component;

component controller_module
  port(RESET_N : in BIT; -- active low asynchronous reset signal
CLK: in BIT;      -- clock signal
Sel_mux1,Sel_mux2,Sel_mux3,Sel_mux4,Sel_mux5,Sel_mux6,add_sub: out INTEGER;
Reg_t3,Reg_t6,Reg_y,Reg_x1,Reg_x,Reg_u,Reg_t5: out INTEGER;

c: IN INTEGER);
end component;
 
 for ic1: datapath_module use entity work.DataPath;
 for ic2: controller_module use entity work.ControllerPath;
 
Signal Sel_mux1,Sel_mux2,Sel_mux3,Sel_mux4,Sel_mux5,Sel_mux6,add_sub: integer;
Signal Reg_t3,Reg_t6,Reg_y,Reg_x1,Reg_x,Reg_u,Reg_t5: INTEGER;

Signal c: INTEGER;
 
 begin 
   
 ic1: datapath_module port map (CLK=>CLK,RESET_IN=> RESET_N,X0=>X0,Y0=>Y0,U0=>U0,DX=>DX,A=>A,Xi=>Xi,
 Yi=>Yi, Sel_mux1 => Sel_mux1,Sel_mux2=>Sel_mux2,Sel_mux3=>Sel_mux3,Sel_mux4=>Sel_mux4,Sel_mux5=>Sel_mux5,Sel_mux6=>Sel_mux6,
 add_sub =>add_sub,Reg_t3=>Reg_t3,Reg_t6=>Reg_t6,Reg_y=>Reg_y,Reg_x1=>Reg_x1,Reg_x=>Reg_x,Reg_u=>Reg_u,
 Reg_t5=>Reg_t5,c=>c);
 
 ic2: controller_module port map (CLK=>CLK,RESET_N=> RESET_N, Sel_mux1 => Sel_mux1,Sel_mux2=>Sel_mux2,Sel_mux3=>Sel_mux3,Sel_mux4=>Sel_mux4,Sel_mux5=>Sel_mux5,Sel_mux6=>Sel_mux6,
 add_sub =>add_sub,Reg_t3=>Reg_t3,Reg_t6=>Reg_t6,Reg_y=>Reg_y,Reg_x1=>Reg_x1,Reg_x=>Reg_x,Reg_u=>Reg_u,
 Reg_t5=>Reg_t5,c=>c);


end structural;

architecture BEHAVIOUR of DIFF_EQ_SOLVER is
begin
  process
    variable x1 : INTEGER;
    variable y1 : INTEGER;
    variable u  : INTEGER;
    variable x  : INTEGER;
    variable y  : INTEGER;
  begin
    -- initialization of variables and outputs
    wait on CLK until CLK = '1';
    u := U0;
    x := X0;
    y := Y0;
    Xi <= x;
    Yi <= y;
    -- start of algorithm
    loop
      -- waits to make output of this behavioural model 
      -- comparable to the output of the imsim:/tb_diff_eq_solver/clk
 
      -- which needs 4 clock cycles per loop iteration
      wait on CLK until CLK = '1';
      wait on CLK until CLK = '1';
      wait on CLK until CLK = '1';
      wait on CLK until CLK = '1';


      -- solver algorithm
      x1 := x + dx;
      y1 := y + (u * dx);
      u  := u - (5 * x * u * dx) - (3 * y * dx);
      x  := x1;
      y  := y1;
      exit when not(x1 < A);
      -- output of current point
      Xi <= x;
      Yi <= y;
    end loop;
    wait; -- forever
  end process;
 
  
end BEHAVIOUR;
