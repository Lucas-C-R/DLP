library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Q3 is
	generic
	(
		N	: natural  :=	8
	);
	port
	(
		X		:	in  std_logic_vector(N-1 downto 0);
		
		Y		:	out std_logic_vector(N-1 downto 0)
	);
end entity;

architecture p_H_v1 of Q3 is
begin
	process(X) is 
		variable cont : natural range 0 to N;
	begin 
		cont := 0;
		
		for i in 0 to N-1 loop
			case X(i) is
				when '1' => cont := cont + 1;
				when others => next;
			end case;
		end loop;
		Y <= std_logic_vector(to_unsigned(cont, Y'length));
	end process; 
end architecture;
