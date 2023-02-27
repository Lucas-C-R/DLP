library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_bidirec_0aN is
	generic
	(
		N : natural := 3
	);
	
	port
	(		
		clk, rst, dir	: in  std_logic;
		
		q					: out std_logic_vector(N-1 downto 0)
	);
end entity;

-- Contador bidirecional de 0 a N
architecture cnt_v1 of contador_bidirec_0aN is
begin

	process(rst, clk) is
		variable count : integer range 0 to 2 ** N - 1;
	begin 
		if(rst = '1') then
			count := 0; 
		elsif(rising_edge(clk)) then
			if(dir = '0') then
				count := count + 1;
			else	
				count := count - 1;
			end if;
		end if;
		q <= std_logic_vector(to_unsigned(count, q'length));
	end process; 
	
end architecture;

-- Contador bidirecional de 0 a 5
architecture cnt_v2 of contador_bidirec_0aN is
begin

	process(rst, clk) is
		variable count : integer range 0 to 2 ** N - 1;
	begin 
		if(rst = '1') then
			count := 0; 
		elsif(rising_edge(clk)) then
			if(dir = '0') then
				if(count = 5) then
					count := 0;
				else
					count := count + 1;
				end if;
			else
				if(count = 0) then
					count := 5;
				else
					count := count - 1;
				end if;
			end if;
		end if;
		q <= std_logic_vector(to_unsigned(count, q'length));
	end process; 
	
end architecture;