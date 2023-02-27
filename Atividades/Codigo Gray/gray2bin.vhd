-------------------------
-- File: gray2bin.vhd  --
-------------------------

library ieee;
use ieee.std_logic_1164.all;

entity gray2bin is
	generic (N : natural := 10);
	port
	(
		g  : in std_logic_vector(N - 1 downto 0);
		b  : buffer std_logic_vector(N - 1 downto 0)
	);
end entity;

architecture ifsc_v1 of gray2bin is
begin
	b(N - 1) <= g(N - 1);
	
L1: 
	for i in N - 2 downto 0 generate
		b(i) <= g(i) xor b(i + 1);
	end generate;
end architecture;