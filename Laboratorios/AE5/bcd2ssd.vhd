library ieee;
use ieee.std_logic_1164.all;

entity bcd2ssd is

	 generic (AC_CCN : natural := 0);
	 -- AC_CCN = 1 => display de anodo comum
	 -- AC_CCN = 0 => display de catodo comum
    port
    (
        bcd_in : in std_logic_vector(3 downto 0);
		  ssd_out: out std_logic_vector(6 downto 0)
    );
end entity;

architecture ifsc_v1 of bcd2ssd is
	signal ssd_aux : std_logic_vector(6 downto 0);
begin

	with bcd_in select -- fazer para todos os valores da tabela do display 7 segmentos
		ssd_aux <= "0111111" when "0000",
					  "0000110" when "0001",
					  "1011011" when "0010",
					  "1001111" when "0011",
					  "1100110" when "0100",
					  "1101101" when "0101",
					  "1111101" when "0110",
					  "0000111" when "0111",
					  "1111111" when "1000",
					  "1101111" when "1001",
					  "1111001" when others; -- Para escrever "E" de "Erro" na tela
	ssd_out <= ssd_aux when AC_CCN = 0 else not ssd_aux;
					
end architecture;

