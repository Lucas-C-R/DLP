-------------------------
-- File: bin2gray.vhd  --
-------------------------

library ieee;
use ieee.std_logic_1164.all;

entity bin2gray is
	generic (N : natural := 4);
	port
	(
		g  : out std_logic_vector(N - 1 downto 0);
		b  : in std_logic_vector(N - 1 downto 0)
	);
end entity;

architecture ifsc_v1 of bin2gray is
begin
	g(3) <= b(3);
	g(2) <= b(2) xor b(3);
	g(1) <= b(1) xor b(2);
	g(0) <= b(0) xor b(1);
end architecture;

architecture ifsc_v2 of bin2gray is
begin
	g(N - 1) <= b(N - 1);
	
L1: 
	for i in N - 2 downto 0 generate
		g(i) <= b(i) xor b(i + 1);
	end generate;

end architecture;

configuration bin2gray_config of bin2gray is
--	for ifsc_v1 end for;
	for ifsc_v2 end for;
end configuration;