library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity operadores is
	port (
		a     : in std_logic_vector(5 downto 0); -- 6 bits
		b     : in std_logic_vector(2 downto 0); -- 3 bits
		sum   : out std_logic_vector(5 downto 0) -- 6 bits 
--		sub   : out std_logic_vector(? downto 0); -- ? bits 
--		mult  : out std_logic_vector(? downto 0); -- ? bits
--		div   : out std_logic_vector(? downto 0); -- ? bits
--		resto : out std_logic_vector(? downto 0)  -- ? bits
	);
end entity;

architecture type_conv_arch of operadores is
-- Declarar os sinais necessarios para fazer as conversoes de tipo 
	signal a_uns	:	unsigned(a'range);
	signal b_uns	:	unsigned(b'range);
	signal sum_uns	:	unsigned(sum'range);
begin
-- Inserir o codigo e definir o tamanho das saidas.
	sum	<=	unsigned(sum_uns);
	
	sum_uns	<= a_uns + b_uns;
end architecture;