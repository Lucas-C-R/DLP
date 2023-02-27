library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity COMP1 is
	generic
	(
		N	: natural  :=	4
	);
	port
	(
		IN1	:	in	std_logic_vector(N-1 downto 0);
		IN2	:	in	std_logic_vector(N-1 downto 0);
		OP		:	in	std_logic_vector(0 downto 0);

		SUM	: out	std_logic_vector(N-1 downto 0)
	);
end entity;

architecture soma_v1 of COMP1 is
	signal IN1_aux, IN2_aux, SUM_aux : unsigned(SUM'range);
begin
	IN1_aux <= unsigned(IN1);
	IN2_aux <= unsigned(IN2);

	with OP select
	SUM_aux <= IN1_aux + IN2_aux when "0",
				  IN1_aux + 1 when others;
				  
	SUM <= std_logic_vector(SUM_aux);
end architecture;