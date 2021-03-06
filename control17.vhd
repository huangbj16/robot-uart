library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity control17 is
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
end control17;

architecture arch of control17 is

component copycontrol
	PORT(clk: IN std_logic;
        input: in integer range 500 to 2500; 
        ctl: OUT std_logic);
END component;

signal angle0: integer range 500 to 2500;
signal angle1, angle2, angle3: integer range 500 to 2500;
signal angle4, angle5, angle6: integer range 500 to 2500;
signal angle7, angle8, angle9, angle10, angle11: integer range 500 to 2500;
signal angle12, angle13, angle14, angle15, angle16: integer range 500 to 2500;

begin
	u0: copycontrol port map(clk, angle0, rotate(0));
	u1: copycontrol port map(clk, angle1, rotate(1));
	u2: copycontrol port map(clk, angle2, rotate(2));
	u3: copycontrol port map(clk, angle3, rotate(3));
	u4: copycontrol port map(clk, angle4, rotate(4));
	u5: copycontrol port map(clk, angle5, rotate(5));
	u6: copycontrol port map(clk, angle6, rotate(6));
	u7: copycontrol port map(clk, angle7, rotate(7));
	u8: copycontrol port map(clk, angle8, rotate(8));
	u9: copycontrol port map(clk, angle9, rotate(9));
	u10: copycontrol port map(clk, angle10, rotate(10));
	u11: copycontrol port map(clk, angle11, rotate(11));
	u12: copycontrol port map(clk, angle12, rotate(12));
	u13: copycontrol port map(clk, angle13, rotate(13));
	u14: copycontrol port map(clk, angle14, rotate(14));
	u15: copycontrol port map(clk, angle15, rotate(15));
	u16: copycontrol port map(clk, angle16, rotate(16));
	
	process(mode)
	begin
		if mode = 0 then
			angle0 <= 1500;  
			angle1 <= 2000;
			angle2 <= 1500;
			angle3 <= 1500;
			angle4 <= 1000;
			angle5 <= 1500;
			angle6 <= 1500;
			angle7 <= 1500;
			angle8 <= 1525;
			angle9 <= 800;
			angle10 <= 1500;
			angle11 <= 2000;
			angle12 <= 1450;
			angle13 <= 1475;
			angle14 <= 2150;
			angle15 <= 1500;
			angle16 <= 1500;
		elsif mode = 1 then
			angle0 <= 1500; 
			angle1 <= 2000;
			angle2 <= 1500;
			angle3 <= 1500;
			angle4 <= 1000;
			angle5 <= 1500;
			angle6 <= 1500;
			angle7 <= 1500;
			angle8 <= 1800;
			angle9 <= 800;
			angle10 <= 1700;
			angle11 <= 2000;
			angle12 <= 1450;
			angle13 <= 1475;
			angle14 <= 2150;
			angle15 <= 1500;
			angle16 <= 1500;
		elsif mode = 2 then
			angle0 <= 1500; 
			angle1 <= 2000;
			angle2 <= 1500;
			angle3 <= 1500;
			angle4 <= 1000;
			angle5 <= 1500;
			angle6 <= 1500;
			angle7 <= 1500;
			angle8 <= 1800;
			angle9 <= 800;
			angle10 <= 1700;
			angle11 <= 2000;
			angle12 <= 1450;
			angle13 <= 1675;
			angle14 <= 2400;
			angle15 <= 1500;
			angle16 <= 1500;
		elsif mode = 3 then
			angle0 <= 1500; 
			angle1 <= 2000;
			angle2 <= 1500;
			angle3 <= 1500;
			angle4 <= 1000;
			angle5 <= 1500;
			angle6 <= 1500;
			angle7 <= 1500;
			angle8 <= 1525;
			angle9 <= 800;
			angle10 <= 1500;
			angle11 <= 2000;
			angle12 <= 1450;
			angle13 <= 1675;
			angle14 <= 2400;
			angle15 <= 1500;
			angle16 <= 1500;
		elsif mode = 4 then		
			angle0 <= 1500;  	
			angle1 <= 2000;	
			angle2 <= 1500;	
			angle3 <= 1500;	
			angle4 <= 1000;	
			angle5 <= 1500;	
			angle6 <= 1500;	
			angle7 <= 1500;	
			angle8 <= 1525;	
			angle9 <= 800;	
			angle10 <= 1500;	
			angle11 <= 2000;	
			angle12 <= 1450;	
			angle13 <= 1475;	
			angle14 <= 2150;	
			angle15 <= 1500;	
			angle16 <= 1500;	
		elsif mode = 5 then		
			angle0 <= 1500;  	
			angle1 <= 2000;	
			angle2 <= 1500;	
			angle3 <= 1500;	
			angle4 <= 1000;	
			angle5 <= 1500;	
			angle6 <= 1500;	
			angle7 <= 1500;	
			angle8 <= 1525;	
			angle9 <= 800;	
			angle10 <= 1500;	
			angle11 <= 2000;	
			angle12 <= 1450;	
			angle13 <= 1200;	
			angle14 <= 2150;	
			angle15 <= 1300;	
			angle16 <= 1500;	
		elsif mode = 6 then		
			angle0 <= 1500;  	
			angle1 <= 2000;	
			angle2 <= 1500;	
			angle3 <= 1500;	
			angle4 <= 1000;	
			angle5 <= 1500;	
			angle6 <= 1500;	
			angle7 <= 1500;	
			angle8 <= 1325;	
			angle9 <= 550;	
			angle10 <= 1500;	
			angle11 <= 2000;	
			angle12 <= 1450;	
			angle13 <= 1200;	
			angle14 <= 2150;	
			angle15 <= 1300;	
			angle16 <= 1500;	
		elsif mode = 7 then		
			angle0 <= 1500;  	
			angle1 <= 2000;	
			angle2 <= 1500;	
			angle3 <= 1500;	
			angle4 <= 1000;	
			angle5 <= 1500;	
			angle6 <= 1500;	
			angle7 <= 1500;	
			angle8 <= 1325;	
			angle9 <= 550;	
			angle10 <= 1500;	
			angle11 <= 2000;	
			angle12 <= 1450;	
			angle13 <= 1475;	
			angle14 <= 2150;	
			angle15 <= 1500;	
			angle16 <= 1500;	
		else
			angle0 <= 1500;  
			angle1 <= 2000;
			angle2 <= 1500;
			angle3 <= 1500;
			angle4 <= 1000;
			angle5 <= 1500;
			angle6 <= 1500;
			angle7 <= 1500;
			angle8 <= 1500;
			angle9 <= 800;
			angle10 <= 1500;
			angle11 <= 2000;
			angle12 <= 1500;
			angle13 <= 1500;
			angle14 <= 2200;
			angle15 <= 1500;
			angle16 <= 1500;
		end if;
	end process;
			
end arch;