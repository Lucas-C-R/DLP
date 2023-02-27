-----Main code: --------
-- File: mux1Dx1D.vhd
-------------------------
use work.my_data_types.all;

entity mux1Dx1D is
	port (
		x   : in a1Dx1D_bit_vector;
		sel : natural range 0 to N-1;
		y   : out BIT_VECTOR(M-1 downto 0)
	);
end entity;

architecture pedroni of mux1Dx1D is
begin
	y <= x(sel);
end architecture;