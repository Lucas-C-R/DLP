library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_bcd is
    generic (max_dezena : natural := 5; max_unidade : natural := 9);
    port
    (
        clk, rst, ena : in std_logic;
		  fim : out std_logic;
        bcd_unidade, bcd_dezena : out std_logic_vector(3 downto 0)
    );
end entity;

architecture cnt_v1 of contador_bcd is
    
begin
L1:    process (clk, rst)
        variable count_un, count_dez : integer range 0 to 9;
    begin
        if (rst = '1') then
            count_un := 0;
            count_dez := 0;
				fim <= '0';
        elsif (rising_edge(clk) and ena = '1') then
                if (max_dezena = count_dez and max_unidade = count_un) then
                    count_dez := 0;
                    count_un := 0;
						  fim <= '1';
                else
						  fim <= '0';
                    if(count_un = 9) then
                         count_un := 0;
                         if(count_dez = 9) then
                             count_dez := 0;
                        else
                             count_dez := count_dez + 1;
                        end if;
                    else
                         count_un := count_un + 1;
                    end if;
                end if;
        end if;
            bcd_unidade <= std_logic_vector(to_unsigned (count_un, 4));
            bcd_dezena <= std_logic_vector(to_unsigned (count_dez, 4));
    end process;
end architecture;

