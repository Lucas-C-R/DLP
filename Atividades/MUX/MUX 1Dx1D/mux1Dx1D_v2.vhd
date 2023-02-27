-----Main code: --------
-- File: mux1Dx1D.vhd
-------------------------
use work.my_data_types.all;

entity mux1Dx1D_v2 is
	generic (NN : natural := 20);
	port (
		x   : in a1Dx1D_bit_vector_v2(0 to NN-1);
		sel : natural range 0 to NN-1;
		y   : out BIT_VECTOR(M-1 downto 0)
	);
end entity;

architecture ifsc of mux1Dx1D_v2 is
begin
	y <= x(sel);
end architecture;