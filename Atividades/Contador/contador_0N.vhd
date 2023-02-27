library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_0N is
	generic
	(
		N : natural := 3
	);
	
	port
	(		
		clk, rst	: in  std_logic;
		
		q			: out std_logic_vector(N-1 downto 0);
		fire 		: out std_logic
	);
end entity;

-- Contador de 0 a 2^N - 1
architecture cnt_v1 of contador_0N is
begin

	process(rst, clk) is
		variable count : integer range 0 to 2 ** N - 1;
	begin 
		if(rst = '1') then
			count := 0; 
		elsif(rising_edge(clk)) then
			count := count + 1;
		end if;
		q <= std_logic_vector(to_unsigned(count, q'length));
	end process; 
	
end architecture;

-- Zera o contador quando ele chega no 5
architecture cnt_v2 of contador_0N is
begin

	process(rst, clk) is
		variable count : integer range 0 to 2 ** N - 1;
	begin 
		if(rst = '1') then
			count := 0; 
		elsif(rising_edge(clk)) then
			if(count = 5) then
				count := 0;
			else	
				count := count + 1;
			end if;
		end if;
		q <= std_logic_vector(to_unsigned(count, q'length));
	end process; 
	
end architecture;

-- Contador com parada
architecture cnt_v3 of contador_0N is
begin

	process(rst, clk) is
		variable count : integer range 0 to 2 ** N - 1;
	begin 
		if(rst = '1') then
			count := 0; 
		elsif(rising_edge(clk)) then
			if(count /= 5) then
				count := count + 1;	
			end if;
		end if;
		q <= std_logic_vector(to_unsigned(count, q'length));
	end process; 
	
end architecture;

-- Contador com parada e com sinalizaçao
architecture cnt_v4 of contador_0N is
begin

	process(rst, clk) is
		variable count : integer range 0 to 2 ** N - 1;
	begin 
		if(rst = '1') then
			count := 0; 
			fire <= '0';
		elsif(rising_edge(clk)) then
			if(count /= 5) then
				count := count + 1;
				fire <= '0';
			else
				fire <= '1';
			end if;
		end if;
		q <= std_logic_vector(to_unsigned(count, q'length));
	end process; 
	
end architecture;