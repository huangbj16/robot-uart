library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity top is 
port(
	clk_t : in std_logic;
	uart_tx : out std_logic;
	uart_rx : in std_logic;
	rotate: out std_logic_vector(16 downto 0)
);
end entity;

architecture behav of top is
	component uart is
		port(
			clk :	in	std_logic;	--50MHz 时钟
			rst :	in	std_logic;
			rx :	in	std_logic;
			LEDRX :	out	std_logic_vector(7 downto 0);--接收 RX 数据显示到数码管
			debug: out std_logic;
			tx :	out	std_logic
		);
	end component;
	
	component move is
		port(clk: in std_logic;
		mode_input: in std_logic_vector(7 downto 0);
		spin: out std_logic_vector (16 downto 0));
	end component;
signal rst_default: std_logic := '1';
signal LEDRX_temp: std_logic_vector(7 downto 0);
signal debug_output: std_logic;
begin
	uart1: uart port map(clk_t, rst_default, uart_rx, LEDRX_temp, debug_output, uart_tx);
	move1: move port map(clk_t, LEDRX_temp, rotate);
end behav;