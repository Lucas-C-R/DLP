library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ff_d is
	port
	(
		d, clk, rst, rst_sinc	: in std_logic;
		q								: out std_logic
	);
end entity;

architecture ifsc_v1 of ff_d is
	begin
	--Flip Flop tipo D com reset assincrono, sensivel a borda de subida.
	process (clk,rst)
	begin
		if (rst = '1') then
			q <= '0';
	-- elsif (clock'event and clock = '1') then or
		elsif (rising_edge(clk)) then
			if (rst_sinc = '1') then
				q <= '0';
			else
				q <= d;
			end if;
		end if;
	end process;

end architecture;
