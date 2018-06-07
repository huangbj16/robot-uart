library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity move is
port(clk: in std_logic;
	mode_input: in std_logic_vector(7 downto 0);
	spin: out std_logic_vector (16 downto 0));
end move;

architecture arch of move is

component control17
port(clk: in std_logic;
	rotate: out std_logic_vector (16 downto 0);--range (500, 2500)
	--0: head
	--1: left arm1
	--2: left arm2
	--3: left arm3
	--4: right arm1
	--5: right arm2
	--6: right arm3
	--7: left leg1
	--8: left leg2
	--9: left leg3
	--10: left leg4
	--11: left leg5
	--12: right leg1
	--13: right leg2
	--14: right leg3
	--15: right leg4
	--16: right leg5
	mode: integer range 0 to 10);
end component;

signal count: integer range 0 to 100000000;
signal mode: integer range 0 to 10 := 1;
signal mode2: integer range 0 to 10 := 0;
begin
	u1: control17 port map(clk, spin, mode);
	process(clk)
	begin
		if clk'event and clk = '1' then
			count <= count + 1;
			if count =25000000 then
				count <= 0;
				if mode2 = 0 then
					mode <= 0;
				elsif mode2 = 1 then
					mode <= (mode + 1) mod 8;
				end if;
			end if;
		end if;
	end process;
	
	process(mode_input)
	begin
		if mode_input = "00000000" then
			mode2 <= 0;
		elsif mode_input = "11111111" then
			mode2 <= 1;
		end if;
	end process;
end arch;



