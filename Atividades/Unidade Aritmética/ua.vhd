library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ua is
	generic (N : natural := 4);
	port
	(
		a 			: in std_logic_vector(N-1 downto 0);
		b 			: in std_logic_vector(N-1 downto 0);
		opcode	: in std_logic_vector(2 downto 0);
--		cin		: in std_logic;	-- Para a versao 2
		cin		: in std_logic_vector(0 downto 0);	-- Para a versao 3
		y			: out std_logic_vector(N downto 0)
	
	);
end entity;

architecture lucas_v1 of ua is
	signal a_uns, b_uns, y_uns : unsigned(y'range);	-- Precisa ter o range da saida, pois se realizar a soma sem o bit a mais, essa informaçao sera perdida
begin
	a_uns <= resize(unsigned(a), y'length);	-- Precisa ter o tamanho do y
	b_uns <= resize(unsigned(b), y'length);
	
	y_uns <= a_uns + b_uns;
		
	y <= std_logic_vector(y_uns);
end architecture;

--architecture lucas_v2 of ua is
--	signal a_uns, b_uns, y_uns : unsigned(y'range);
--	
--	function "+" (a : unsigned; b : std_logic) return unsigned is	-- Funcao para somar um unsigned com um std_logic
--		begin
--			if (b = '1') then return a + 1;
--			else
--				return a;
--			end if;
--	end "+";
--begin
--	a_uns <= resize(unsigned(a), y'length);
--	b_uns <= resize(unsigned(b), y'length);
--	
--L1: 
--	with opcode(1 downto 0) select
--	y_uns <= a_uns + b_uns when "00",
--				a_uns - b_uns when "01",
--				b_uns - a_uns when "10",
--				a_uns + b_uns + cin when others;
--		
--	y <= std_logic_vector(y_uns);
--end architecture;

architecture lucas_v3 of ua is
	signal a_uns, b_uns, y_uns : unsigned(y'range);
begin
	a_uns <= resize(unsigned(a), y'length);
	b_uns <= resize(unsigned(b), y'length);
	
L1: 
	with opcode(1 downto 0) select
	y_uns <= a_uns + b_uns when "00",
				a_uns - b_uns when "01",
				b_uns - a_uns when "10",
				a_uns + b_uns + unsigned(cin) when others;
		
	y <= std_logic_vector(y_uns);
	
end architecture;
configuration config_ua of ua is
--	for lucas_v1 end for;
--	for lucas_v2 end for;
	for lucas_v3 end for;
end configuration;
