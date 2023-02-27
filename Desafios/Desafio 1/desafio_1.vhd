library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity desafio_1 is
	generic (N : natural := 9);
	port
	(
		x	: in  std_logic_vector(N-1 downto 0);
		y	: out std_logic
	);
end entity;

architecture detector_vagas of desafio_1 is
	signal y_std : std_logic;
begin

	y_std <= x(0) and x(1) and x(2) and x(3) and x(4) and x(5) and x(6) and x(7) and x(8);

	y <= not y_std;
	
end architecture;
