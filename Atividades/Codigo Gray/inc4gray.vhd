-------------------------
-- File: inc4gray.vhd  --
-------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity inc4gray is
	generic (N : natural := 4);
	port
	(
		g_in	: in std_logic_vector(N - 1 downto 0);
		g_out	: out std_logic_vector(N - 1 downto 0)
	);
end entity;

architecture ifsc_v1 of inc4gray is
signal b_in, b_out	:	signed(N - 1 downto 0);
begin
	b_in(N - 1) <= g_in(N - 1);
	
L1: 
	for i in N - 2 downto 0 generate
		b_in(i) <= g_in(i) xor b_in(i + 1);
	end generate;
	
	b_out <= b_in + 1;
	
	g_out(N - 1) <= b_out(N - 1);
	
L2: 
	for i in N - 2 downto 0 generate
		g_out(i) <= b_out(i) xor b_out(i + 1);
	end generate;
end architecture;