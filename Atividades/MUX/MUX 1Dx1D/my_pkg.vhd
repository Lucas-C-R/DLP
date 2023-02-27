-----Package:------------
-- File: my_pkg.vhd
-------------------------
package my_data_types is
	constant N: natural := 10;
	constant M: natural := 8;
	type a1Dx1D_bit_vector is array (0 to N-1) of BIT_VECTOR(M-1 downto 0);
	type a1Dx1D_bit_vector_v2 is array (natural range <>) of BIT_VECTOR(M-1 downto 0);
end my_data_types;
