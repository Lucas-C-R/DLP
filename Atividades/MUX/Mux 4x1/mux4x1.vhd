library ieee;
use ieee.std_logic_1164.all;

entity mux4x1 is
generic (N : natural := 4);
	port 
	(
		x		: in STD_LOGIC_VECTOR(N-1 downto 0);
		sel   : in STD_LOGIC_VECTOR(1 downto 0);
		y     : out STD_LOGIC
	);
end entity;

architecture operators_only of mux4x1 is
	alias x0 is x(0);
	alias x1 is x(1);
	alias x2 is x(2);
	alias x3 is x(3);
begin
	y <= (not sel(1) and not sel(0) and x0) or
		(not sel(1) and sel(0) and x1) or
		(sel(1) and not sel(0) and x2) or
		(sel(1) and sel(0) and x3);
end architecture;

architecture operators_only_alias of mux4x1 is
	alias x0 is x(0);
	alias x1 is x(1);
	alias x2 is x(2);
	alias x3 is x(3);
	
	alias s1 is sel(1);
	alias s0 is sel(0);
begin
	y <= (not s1 and not s0 and x0) or
		(not s1 and s0 and x1) or
		(s1 and not s0 and x2) or
		(s1 and s0 and x3);
end architecture;

architecture WHEN_ELSE of mux4x1 is
	alias x0 is x(0);
	alias x1 is x(1);
	alias x2 is x(2);
	alias x3 is x(3);
begin
	y <= x0 when sel = "00" else
        x1 when sel = "01" else
	     x2 when sel = "10" else
		  x3;
end architecture;

architecture WITH_SELECT of mux4x1 is
	alias x0 is x(0);
	alias x1 is x(1);
	alias x2 is x(2);
	alias x3 is x(3);
begin
	with sel select
	y <= x0 when "00", 
	     x1 when "01",
	     x2 when "10",
		  x3 when others;
end architecture;

configuration which_mux of mux4x1 is
--	for operators_only end for;
--	for operators_only_alias end for;
--	for WHEN_ELSE end for;
	for WITH_SELECT end for;
end configuration;