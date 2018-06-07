library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity uart is
port(
	clk :	in	std_logic;	--50MHz 时钟
	rst :	in	std_logic;
	rx :	in	std_logic;
	LEDRX :	out	std_logic_vector(7 downto 0);--接收 RX 数据显示到数码管
	debug: out std_logic;
	tx :	out	std_logic
);
end entity;


architecture behaviour of uart is
	signal cnt: integer range 0 to 5300 := 0;
	signal uart_clk : std_logic;
	signal cnt2: integer range 0 to 9; --状态跳转计数器
	signal rx8bit:std_logic_vector(7 downto 0);--接收数据的寄存器
	signal cnt1: integer range 0 to 9;
	signal tx8bit: std_logic_vector(7 downto 0) := "00000000";
	signal de :integer:= 0;
begin
	process(rx)
	begin
		if rx8bit(7 downto 0) = "00000000" then
			de <= 0;
		end if;
		if de = 1 then
			debug <= '1';
		else 
			debug <= '0';
		end if;
	end process;
	
	bps:process(rst,clk)
	begin
		if	rst='0' then
			cnt<=0;
		elsif (clk'event and clk='1') then --时钟计数器
			if	cnt = 5208 then	
				cnt<=0;
			else
				cnt<=cnt+1;
			end if;
		end if;
	end process;
	
	process(clk,rst)
	begin
		if	rst='0'	then	
			uart_clk<='0';
		elsif clk'event and clk='1' then	
			if	(cnt=5208) then
				uart_clk<='1'; --波特率高电平
			elsif (cnt = 2604) then
				uart_clk<='0'; --波特率低电平
			end if;
		end if;
	end process;
	
	process(rst,clk, rx)
	begin	
		if	rst='0'	then	
			rx8bit<=(others=>'1');
		elsif	uart_clk'event	and uart_clk='1' then	
		--elsif clk'event and clk = '1' then 
			case cnt2 is
				when 0 =>	
					if rx='0' then
						cnt2 <= cnt2 + 1;
					end if;
				when 1 =>
					rx8bit(0) <= rx;
					cnt2 <= cnt2 + 1;
				when 2 =>
					rx8bit(1) <= rx;
					cnt2 <= cnt2 + 1;
				when 3 =>
					rx8bit(2)<=rx;
					cnt2<=cnt2+1;
				when 4 =>
					rx8bit(3)<=rx;
					cnt2<=cnt2+1;
				when 5 =>
					rx8bit(4)<=rx;
					cnt2<=cnt2+1;
				when 6 =>
					rx8bit(5)<=rx;
					cnt2<=cnt2+1;
				when 7 =>
					rx8bit(6)<=rx;
					cnt2<=cnt2+1;
				when 8 =>
					rx8bit(7)<=rx;
					cnt2<=cnt2+1;
				when 9 => 
					if	rx='1' then
						LEDRX<=rx8bit;
					end if;
					cnt2<=0;
				when others =>
					cnt2<=0;
			end case;
		end	if	;
	end process;
	
	
	process(rst,clk)
	begin	
		if	rst='0'	then	
			cnt1<=0;
		elsif	uart_clk'event	and uart_clk='1'	then	
			if	cnt1=9	then
				cnt1<=0;
			else
				cnt1<=cnt1+1;
			end	if	;
		end	if	;
	end	process;
	
	process(rst,clk)
	begin	
		if	rst='0'	then		
			tx<='0';
		elsif	clk'event	and	clk='1'	then	
			case	cnt1	is
				when	0	=>tx<='0'; --起始位 发送低电平代
				when	1	=>tx<=tx8bit(0);
				when	2	=>tx<=tx8bit(1);
				when	3	=>tx<=tx8bit(2);
				when	4	=>tx<=tx8bit(3);
				when	5	=>tx<=tx8bit(4);
				when	6	=>tx<=tx8bit(5);
				when	7	=>tx<=tx8bit(6);
				when	8	=>tx<=tx8bit(7);
				when	9	=>tx<='1'; --停止位 发送高电平
				when	others=>	tx<='0';
			end	case	;
		end	if	;
	end	process;
	
end architecture behaviour;

