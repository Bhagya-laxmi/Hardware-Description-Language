--clock generator module which has one output only.

entity clock_generator is
generic( prop_delay: in time := 5 ns);
 port( clk_output: inout bit);
end clock_generator;

architecture clock_arch of clock_generator is
begin

clock_gen: process(clk_output)
begin
 if (not clk_output = '1') then
   clk_output <= '1' after 3 ns, '0' after 5 ns;
 end if;
end process clock_gen;
end clock_arch;

architecture clock_arch1 of clock_generator is
begin

clock_gen: process
begin
clk_output <= '1' after prop_delay, '0' after (2*prop_delay);
wait until (not clk_output = '1');
end process clock_gen;
end clock_arch1;
