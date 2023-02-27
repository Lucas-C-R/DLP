library ieee, work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.my_pkg.all;

entity vector_adder is
	generic (N : natural := 10);
	port (
		a	  : in a_slv (0 to N-1);
		soma : out std_logic_vector (3 downto 0));
end entity;

-- Versão que realiza a soma diretamente, mas que precisa modificar o código de acordo com o número de entradas.

architecture ifsc_v1 of vector_adder is
	signal soma_sig : signed(3 downto 0);
begin
	soma_sig <= signed(a(0)) + signed(a(1)) + signed(a(2)) +  signed(a(3));
	soma <= std_logic_vector(soma_sig);
end architecture;

architecture ifsc_v2 of vector_adder is
	signal soma_sig : signed(3 downto 0);
begin
	soma_sig <= (signed(a(0)) + signed(a(1))) + (signed(a(2)) +  signed(a(3)));
	soma <= std_logic_vector(soma_sig);
end architecture;

-- Versão que prepara a soma para um FOR GENERATE
architecture ifsc_v3 of vector_adder is
		type a_sig is array(natural range <>) of signed (3 downto 0);
		signal sum	:	a_sig (0 to N-1);
begin
	 sum(0)	<= signed(a(0));
    sum(1)	<= sum(0) + signed(a(1));
    sum(2)	<= sum(1) + signed(a(2));
    sum(3)	<= sum(2) + signed(a(3));
    soma		<= std_logic_vector(sum(3));
end architecture;

-- Versão que realiza a soma usando um FOR GENERATE
architecture ifsc_v4 of vector_adder is
		type a_sig is array(natural range <>) of signed (3 downto 0);
		signal sum	:	a_sig (0 to N-1);
begin
	 sum(0)	<= signed(a(0));
	 
L1: 
	for i in 1 to N - 1 generate
		sum(i) <= sum(i - 1) + signed(a(i));
	end generate;
	
	soma <= std_logic_vector(sum(N - 1));
end architecture;

configuration ifsc_cfg of vector_adder is
--	for ifsc_v1 end for;
--	for ifsc_v2 end for;
--	for ifsc_v3 end for;
	for ifsc_v4 end for;
end configuration;