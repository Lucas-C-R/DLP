library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity desafio_3 is
	port
	(
		x : in std_logic_vector(8 downto 0);
		y : out std_logic
	);
end entity;

architecture detector_vagas of desafio_3 is
begin
	y	<=	'1' when std_match(x, "0--------") else
			'1' when std_match(x, "-0-------") else 
			'1' when std_match(x, "--0------") else
			'1' when std_match(x, "---0-----") else
			'1' when std_match(x, "----0----") else
			'1' when std_match(x, "-----0---") else
			'1' when std_match(x, "------0--") else
			'1' when std_match(x, "-------0-") else
			'1' when std_match(x, "--------0") else
			'0';
end architecture;
