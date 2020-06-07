--Edge-trigerred register with timing check
--the register has data input and a data output with a clock bit. whena clock changes from 0 to 1, the data input is sampled. stored and transmitted t the output.
--Let us suppose the clock must stay 1 for 5 ns.
-- when clk transits from 1 to 0, time duration is checked to see if 5ns positive pulse has occured or not

entity edge_trigger is
port( clk: in bit; d_in: in real; d_out: out real);
end edge_trigger;

architecture trigger_arch of edge_trigger is
begin

store_and_check: process(clk)
 variable pulse_start: TIME;
 variable stored_value: real;
begin

if rising_edge(clk) then
  pulse_start := now;
  stored_value := d_in;
  d_out <= stored_value;
else
  assert now = 0 ns or (now- pulse_start) >= 5ns
   report " The clock pulse is too small";
end if;

end process store_and_check;

end trigger_arch;
