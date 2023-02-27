library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity desafio_5 is
	port
	(
		x		: in  integer range 0 to 111111111;
		cnt	: out std_logic_vector(3 downto 0)
	);
end entity;

architecture contador_vagas of desafio_5 is

	type vetor is array(natural range 8 downto 0) of integer range 0 to 9;
	signal cnt_int : vetor;
	signal x_uns : unsigned(8 downto 0);

begin
	
	x_uns <= to_unsigned(x, 9);

	with x_uns(0) select
	cnt_int(0) <=	1 when '0',
						0 when others;

l1: 
	for i in 1 to 8 generate
		with x_uns(i) select
		cnt_int(i) <=	cnt_int(i-1) + 1 when '0',
							cnt_int(i-1) when others;
	end generate;

	cnt <= std_logic_vector(to_unsigned(cnt_int(8), 4));

end architecture;

