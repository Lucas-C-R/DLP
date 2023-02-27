library ieee, work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vector_and is
	generic (N : natural := 32);
	port (
		a	  : in std_logic_vector (N-1 downto 0);
		b 	  : out std_logic
	);
end entity;

architecture ifsc_v1 of vector_and is
	signal sig : std_logic_vector(N-1 downto 0);
begin
	sig(0) <= a(0);

L1:
	for i in 1 to N - 1 generate
		sig(i) <= sig(i - 1) and a(i);
	end generate;
	
	b <= sig(N - 1);
end architecture;