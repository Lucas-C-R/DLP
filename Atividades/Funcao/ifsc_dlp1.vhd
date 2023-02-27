library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package ifsc_dlp1 is

	function bcd2ssd_f (bcd_in : std_logic_vector; AC_CCN : natural) return std_logic_vector;

end package;

package body ifsc_dlp1 is

	function bcd2ssd_f (bcd_in : std_logic_vector; AC_CCN : natural) return std_logic_vector is
		variable ssd_aux : std_logic_vector(6 downto 0);
	begin
		case bcd_in is
			when "0000" => ssd_aux := "0111111";
			when "0001" => ssd_aux := "0000110";
			when "0010" => ssd_aux := "1011011";
			when "0011" => ssd_aux := "1001111";
			when "0100" => ssd_aux := "1100110";
			when "0101" => ssd_aux := "1101101";
			when "0110" => ssd_aux := "1111101";
			when "0111" => ssd_aux := "0000111";
			when "1000" => ssd_aux := "1111111";
			when "1001" => ssd_aux := "1101111";
			when others => ssd_aux := "1111001";
		end case;
			if AC_CCN = 0 then
				return ssd_aux;
			else 
				return not ssd_aux;
			end if;
	end function;

end package body;