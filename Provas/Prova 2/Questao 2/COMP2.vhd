library ieee;
use ieee.std_logic_1164.all;

entity COMP2 is
	generic
	(
		N	: natural  :=	4
	);
	port
	(
		rst	:	in	std_logic;
		clk	:	in	std_logic;
		X		:	in std_logic_vector(N-1 downto 0);

		Y		:	out std_logic_vector(N-1 downto 0)
	);
end entity;

architecture rg_v1 of COMP2 is
begin
	process(rst, clk) is 
		variable Y_aux : std_logic_vector(N-1 downto 0); 
	begin 
		if(rst = '1') then
			Y_aux := (others => '0');
		elsif(rising_edge(clk)) then 
			for i in X'range loop
				Y_aux(i) := X(i);
			end loop;
		end if;
		Y <= Y_aux;
	end process; 
end architecture;
