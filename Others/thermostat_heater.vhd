--Thermostat Hearter
--The system has two inputs:(1) the desired temperature,(2) the temperature shown by the thermometer.
--It has one output which can be either turn on or turn off. 
--the thermostat turns the heater on when the measured temperature is falls 2 degress less than the desired temperature.
--The thermostat turns off the heater when the measured temperatures rises 2 degress more than the desired temperature.

-- The behavioral model is described here

entity Thermostat is
port( Measured_temp: in integer; Desired_temp: in integer;
      Heater_on: out boolean);
end Thermostat;

architecture Thermostat_arch of Thermostat is
type status is (turn_on,turn_off);


begin

P1:process
variable Heater_status: status:= turn_off;
begin

 Temperature_check: if (Measured_temp > Desired_temp +2 )then
  Heater_status:= turn_off;
 elsif (Measured_temp < Desired_temp-2 ) then
  Heater_status:= turn_on;
 else
  Heater_status:= turn_off;
end if Temperature_check;

if(Heater_status = turn_off)then
 Heater_on<= false;
else
 Heater_on <= true;
end if;
wait on Measured_temp, Desired_temp;
end process;
end Thermostat_arch;
