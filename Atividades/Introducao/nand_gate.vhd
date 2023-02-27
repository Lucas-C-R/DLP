library std;
use std.standard.all;

entity nand_gate is
	port (a, b: in bit; x: out bit);
end entity;

architecture nome_arch_v1 of nand_gate is
begin
	x <= a nand b;
end architecture;

architecture nome_arch_v2 of nand_gate is
	signal tmp: bit;
begin
	x <= not tmp;
	tmp <= a and b;
end architecture;

configuration cfg_nand of nand_gate is
	for nome_arch_v1
	end for;
end configuration;
