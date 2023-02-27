library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity desafio_4 is
	port
	(
		x		: in  std_logic_vector(8 downto 0);	-- Sao 9 vagas de carro
		cnt	: out std_logic_vector(3 downto 0)	-- Contardor vai de 0 a 9, entao vai de "0000" a "1001"
	);
end entity;

architecture contador_vagas of desafio_4 is	
	type vetor is array(natural range x'range) of unsigned(cnt'range);	-- "vetor" eh um vetor de tamanho 9, que comporta unsigneds de tamanho 4
	signal cnt_uns	: vetor;
	
	function "+" (a : unsigned; b : integer) return unsigned is
		begin
			if (b = 1) then return a + "0001";	--Como o 'a' eh um unsigned de tamanho 4, preciso da formatacao "XXXX"
			else
				return a;
			end if;
	end "+";
begin	
	with x(0) select
		cnt_uns(0) <=	"0001" when '0',
							"0000" when others;					
						
l1: 
	for i in 1 to 8 generate
		with x(i) select
		cnt_uns(i) <=	cnt_uns(i-1) + 1 when '0',	-- Pega o valor da posicao anterior, soma 1 e depois, guarda na posicao atual
							cnt_uns(i-1) when others;	-- Se a vaga estiver ocupada x(i) = 1, entao repete o valor da posicao anterior
	end generate;

	cnt <= std_logic_vector(cnt_uns(8));
end architecture;
