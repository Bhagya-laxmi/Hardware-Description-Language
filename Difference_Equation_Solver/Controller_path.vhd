entity ControllerPath is
port(
RESET_N : in BIT; -- active low asynchronous reset signal
CLK: in BIT;      -- clock signal
Sel_mux1,Sel_mux2,Sel_mux3,Sel_mux4,Sel_mux5,Sel_mux6,add_sub: out INTEGER;
Reg_t3,Reg_t6,Reg_y,Reg_x1,Reg_x,Reg_u,Reg_t5: out INTEGER;

c: IN INTEGER
);
end entity ControllerPath;

architecture Controller_arch of ControllerPath is
  type states is (St1,St2,St3,St4,Quit);
  Signal state: states;
  begin
    
    control_path:process(RESET_N,clk)
    begin
     if (RESET_N = '0') then
     state<=St1;
     elsif( clk'event and clk ='1') then
      case state is
       when St1 => state <= St2;
       when St2=> state <= St3;
       when St3 => state <= St4;
       when St4 =>  
        if( c= 1) then
         state <= St1; 
       elsif (c=0) then
         state <= Quit;
       end if;
      when Quit =>
        
      end case; 
     end if;
    end process control_path;
    
    state_set:process(state)
    begin
    case state is
     when St1=>
      
      Sel_mux1<= 0;
      Sel_mux2<= 0;
      Sel_mux3<= 0;
      Sel_mux4<=0;
      Sel_mux5<=0;
      Sel_mux6<=0;
      add_sub <= 1;
      Reg_t3 <= 1;
      Reg_t6 <= 1;
      Reg_y <= 0;
      Reg_x1 <= 1;
      Reg_x <= 0;
      Reg_u <= 0;
      Reg_t5 <= 0;

      
     when St2=>
      Sel_mux1<= 1;
      Sel_mux2<= 1;
      Sel_mux3<= 1;
      Sel_mux4<=1;
      Sel_mux5<=1;
      Sel_mux6<=1;
      add_sub <= 1;
      Reg_t3 <= 1;
      Reg_t6 <= 1;
      Reg_y <= 1;
      Reg_x1 <= 0;
      Reg_x <= 0;
      Reg_u <= 0;
      Reg_t5 <= 0;

            
    when St3=>
      Sel_mux1<= 2;
      Sel_mux2<= 2;
      Sel_mux3<= 2;
      Sel_mux4<=2;
      Sel_mux5<=4;
      Sel_mux6<=4;
      add_sub <= 0;
      Reg_t3 <= 0;
      Reg_t6 <= 1;
      Reg_y <= 0;
      Reg_x1 <= 0;
      Reg_x <= 0;
      Reg_u <= 0;
      Reg_t5 <= 1;

      
    when St4=>
       Sel_mux1<= 3;
       Sel_mux2<= 3;
       Sel_mux3<= 4;
       Sel_mux4<=4;
       Sel_mux5<=4;
       Sel_mux6<=4;
       add_sub <= 0;
       Reg_t3 <= 0;
       Reg_t6 <= 0;
       Reg_y <= 0;
       Reg_x1 <= 0;
       Reg_x <= 1;
       Reg_u <= 1;
       Reg_t5 <= 0;

      
  when Quit =>

    Sel_mux1<= 4;
    Sel_mux2<= 4;
    Sel_mux3<= 4;
    Sel_mux4<=4;
    Sel_mux5<=4;
    Sel_mux6<=4;
    add_sub <= 0;
    Reg_t3 <= 0;
    Reg_t6 <= 0;
    Reg_y <= 0;
    Reg_x1 <= 0;
    Reg_x <= 0;
    Reg_u <= 0;
    Reg_t5 <= 0;
        
   end case; 
  end process state_set;
  end architecture Controller_arch;
