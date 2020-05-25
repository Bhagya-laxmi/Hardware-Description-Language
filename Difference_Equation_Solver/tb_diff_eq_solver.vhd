entity TB_DIFF_EQ_SOLVER is
end;

architecture TESTBENCH of TB_DIFF_EQ_SOLVER is

  component DIFF_EQ_SOLVER is
    port(
      CLK: in BIT;      -- clock signal
      RESET_N : in BIT;
      X0 : in INTEGER;  -- start value for X
      Y0 : in INTEGER;  -- start value for Y
      U0 : in INTEGER;  -- start value for U
      DX : in INTEGER;  -- X increment
      A  : in INTEGER;  -- limit for X
      Xi : out INTEGER; -- current value of X on the curve
      Yi : out INTEGER  -- current value of Y on the curve
    );
  end component;
  
  signal CLK, RESET_N : BIT;
  signal X0, Y0, U0, DX, A, Xi, Yi : INTEGER;
  
  for DUT: DIFF_EQ_SOLVER use entity work.DIFF_EQ_SOLVER(structural);
  --for DUT: DIFF_EQ_SOLVER use entity work.DIFF_EQ_SOLVER(behaviour);
begin

  CLK_GEN : process(CLK)
  begin
    if NOW < 41_000 NS then 
      CLK <= not CLK after 50 ns;
    end if;
  end process;
  
  DUT : DIFF_EQ_SOLVER port map(CLK,RESET_N,X0,Y0,U0,DX,A,Xi,Yi);
  
  STIMULI : process
  begin
    X0 <= 0;
    Y0 <= 0;
    U0 <= 1;
    DX <= 1;
    A  <= 100;
    RESET_N <= '1';
    wait for 10 ns;
    RESET_N <= '0';
    wait for 10 ns;
    RESET_N <= '1';
    wait; -- forever
  end process;

end;


