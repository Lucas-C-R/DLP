library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Q_erro is
	generic	(N : natural := 3);
	port
	(
		gin			:	in std_logic_vector(N-1 downto 0);
		oe				:	in std_logic;
		
		bin_out		: out std_logic_vector(N-1 downto 0);
		one_hot_out	: out std_logic_vector((2**N)-1 downto 0)
	);
end Q_erro;

architecture s of Q_erro is
	
	signal bin		: std_logic_vector(N-1 downto 0);
	signal one_hot	: std_logic_vector((2**N)-1 downto 0);

begin
	
	-- gray2bin
	bin(2) <= gin(2) xor '0';
	bin(1) <= gin(1) xor gin(2);
	bin(0) <= gin(0) xor bin(1);
	
	-- bin2onehot
l1: 
	for i in 2**N-1 downto 0 generate
		one_hot(i) <= 
						'1' when i = unsigned(bin) else
						'0';
	end generate;
	
	-- three_state
	one_hot_out <= 
					one_hot when oe = '1' else
					"ZZZZZZZZ";
	bin_out <= 
				bin when oe = '1' else
				"ZZZ";
	
end architecture;
