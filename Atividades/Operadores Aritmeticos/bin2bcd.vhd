library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin2bcd is
	port 
	(
		A      : in std_logic_vector (6 downto 0);
		sd, su : out std_logic_vector (3 downto 0)
	);
end entity;

architecture ifsc_v1 of bin2bcd is
	signal A_uns          : unsigned (6 downto 0);
	signal sd_uns, su_uns : unsigned (6 downto 0);

begin
	sd     <= std_logic_vector(resize(sd_uns, 4));
	su     <= std_logic_vector(resize(su_uns, 4));
	sd_uns <= A_uns/10;
	su_uns <= A_uns rem 10;
	A_uns  <= unsigned(A);
end architecture;

architecture ifsc_v2 of bin2bcd is
	signal A_uns          : unsigned (6 downto 0);
	signal sd_uns, su_uns : unsigned (6 downto 0);
begin
	sd     <= std_logic_vector(resize(sd_uns, 4));
	su     <= std_logic_vector(resize(su_uns, 4));
	sd_uns <= A_uns/10;
	su_uns <= resize(A_uns - resize(sd_uns, 4) * 10, 7);
	A_uns  <= unsigned(A);
end architecture;

configuration bin2bcd_cfg of bin2bcd is
--A instrução '''configuration''' associa a '''entity''' bin2bcd a '''architecture'''.
	for ifsc_v1 end for;
--Para associar a '''entity''' bin2bcd a '''architecture''' ifsc_v2 comente a linha acima e descomente a linha abaixo.
--	for ifsc_v2 end for;
end configuration;