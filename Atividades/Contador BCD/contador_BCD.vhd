library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_BCD is
	generic(
		maxD : natural := 5;
		maxU : natural := 9
	);
	port
	(		
		clk, rst	: in  std_logic;
		
		bcd_un, bcd_dez	: out std_logic_vector(3 downto 0)
--		fire 		: out std_logic
	);
end entity;

architecture cnt_v1 of contador_BCD is
begin

	process(rst, clk) is
		variable count_un, count_dez : integer range 0 to 9;
	begin 
		if(rst = '1') then
			count_un		:= 0;
			count_dez	:= 0;
		elsif(rising_edge(clk)) then
			if(count_un = 9) then
				count_un := 0;
				
				if(count_dez = 9) then
					count_dez	:= 0;
				else
					count_dez := count_dez + 1;
				end if;
			else	
				count_un := count_un + 1;
			end if;
		end if;
		bcd_un 	<= std_logic_vector(to_unsigned(count_un, bcd_un'length));
		bcd_dez	<= std_logic_vector(to_unsigned(count_dez, bcd_dez'length));
	end process; 
	
end architecture;

-- Contador para, quando chegar em 59
architecture cnt_v2 of contador_BCD is
begin

	process(rst, clk) is
		variable count_un, count_dez : integer range 0 to 9;
	begin 
		if(rst = '1') then
			count_un		:= 0;
			count_dez	:= 0;
		elsif(rising_edge(clk)) then			
			if(count_un = 9) then			
				if(count_dez = 5) then
					count_un		:= 0;
					count_dez	:= 0;
				else
					count_dez := count_dez + 1;
				end if;
			else	
				count_un := count_un + 1;
			end if;
		end if;
		bcd_un 	<= std_logic_vector(to_unsigned(count_un, bcd_un'length));
		bcd_dez	<= std_logic_vector(to_unsigned(count_dez, bcd_dez'length));
	end process; 
	
end architecture;

-- Contador para, quando chegar no valor generico
architecture cnt_v3 of contador_BCD is
begin

	process(rst, clk) is
		variable count_un, count_dez : integer range 0 to 9;
	begin 
		if(rst = '1') then
			count_un		:= 0;
			count_dez	:= 0;
		elsif(rising_edge(clk)) then			
			if(maxD = count_dez and maxU = count_un) then
				count_un		:= 0;
				count_dez	:= 0;
			elsif(count_un = 9) then			
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
		bcd_un 	<= std_logic_vector(to_unsigned(count_un, bcd_un'length));
		bcd_dez	<= std_logic_vector(to_unsigned(count_dez, bcd_dez'length));
	end process; 
	
end architecture;

configuration cnt_cfg of contador_BCD is
--	for cnt_v1 end for;
--	for cnt_v2 end for;
	for cnt_v3 end for;
end configuration;
