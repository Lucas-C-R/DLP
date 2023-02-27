library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity desafio_2 is
	port
	(
		x		: in  std_logic_vector(8 downto 0);
		cnt	: out std_logic_vector(3 downto 0)
	);
end entity;

architecture contador_vagas of desafio_2 is
	
	type vetor is array(natural range x'range) of unsigned(cnt'range);
	signal cnt_uns	: vetor;

begin

	with x(0) select
	cnt_uns(0)	<= "0000" when '1',
						"0001" when others;

	
l1: 
	for i in 1 to x'high generate
		with x(i) select
		cnt_uns(i) <=	cnt_uns(i-1) + "0001" when '0',
							cnt_uns(i-1) when others;

	end generate;
	
	cnt <= std_logic_vector(cnt_uns(x'high));

end architecture;

