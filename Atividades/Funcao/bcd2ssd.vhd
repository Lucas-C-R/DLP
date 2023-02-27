library ieee;
use ieee.std_logic_1164.all;
use work.ifsc_dlp1.all;
use ieee.numeric_std.all;

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

-- Usando codigo concorrente
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

-- Usando codigo sequencial
architecture ifsc_v2 of bcd2ssd is
	signal ssd_aux : std_logic_vector(6 downto 0);
begin

	process (bcd_in)
	begin
		case bcd_in is
			when "0000" => ssd_aux <= "0111111";
			when "0001" => ssd_aux <= "0000110";
			when "0010" => ssd_aux <= "1011011";
			when "0011" => ssd_aux <= "1001111";
			when "0100" => ssd_aux <= "1100110";
			when "0101" => ssd_aux <= "1101101";
			when "0110" => ssd_aux <= "1111101";
			when "0111" => ssd_aux <= "0000111";
			when "1000" => ssd_aux <= "1111111";
			when "1001" => ssd_aux <= "1101111";
			when others => ssd_aux <= "1111001";
		end case;
			if AC_CCN = 0 then
				ssd_out <= ssd_aux;
			else 
				ssd_out <= not ssd_aux;
			end if;
	end process;
end architecture;