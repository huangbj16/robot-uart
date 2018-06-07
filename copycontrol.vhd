library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity copycontrol is port(
	clk: in std_logic;
	input: in integer range 500 to 2500;--500 is 0.5ms, 2500 is 2.5ms, min and max.
	ctl: out std_logic
);
end copycontrol;

architecture arch of copycontrol is
signal count: integer range 0 to 1000000;--50M Clock, count1000000 = T = 20ms.
signal cout: std_logic := '1';
signal dst: integer range 0 to 250000 := input * 50;
begin
	process(clk)
	begin
		if clk' event and clk='1' then
			if count < dst then
				cout <= '1';
				count <= count + 1;
			elsif count < 1000000 then
				cout <= '0';
				count <= count + 1;
			else
				count <= 0;
			end if;
		end if;
	end process;
	ctl <= cout;
end arch;