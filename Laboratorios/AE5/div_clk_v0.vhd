library ieee;
use ieee.std_logic_1164.all;

entity div_clk_v0 is

--	generic (fclk : natural := 50000000); -- Cristal de 50MHz => 26 Flip-Flops-D 
	generic (fclk : natural := 100); -- Para simulacao => 3 Flip-Flops-D => Perido de simulacao do clock
	 
	port
	(
		clk_in, rst, ena : in std_logic;
		clk_out : out std_logic
	);
end entity;

architecture div_v1 of div_clk_v0 is

begin

L1:	process(rst, clk_in, ena)
		variable contador : integer range 0 to fclk-1;
	begin
		if rst = '1' then 
			contador := 0;
			clk_out <= '1';
		elsif (rising_edge(clk_in) and ena = '1') then
			if (contador = fclk-1) then
				contador := 0;
				clk_out <= '1';
			else
				contador := contador + 1;
				clk_out <= '0';
			end if;
		end if;	
	end process;

end architecture;

