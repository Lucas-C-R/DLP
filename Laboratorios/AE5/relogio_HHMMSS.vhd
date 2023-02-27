library ieee;
use ieee.std_logic_1164.all;

entity relogio_HHMMSS is

    port
    (
        clk_1sec, rst_sw, ligar_sw: in std_logic;
		  ssd_uSS, ssd_dSS: out std_logic_vector(6 downto 0);
		  ssd_uMM, ssd_dMM: out std_logic_vector(6 downto 0);
		  ssd_uHH, ssd_dHH: out std_logic_vector(6 downto 0)
    );
end entity;

architecture ifsc_v1 of relogio_HHMMSS is

	signal bcd_uSS, bcd_dSS: std_logic_vector(3 downto 0);
	signal bcd_uMM, bcd_dMM: std_logic_vector(3 downto 0);
	signal bcd_uHH, bcd_dHH: std_logic_vector(3 downto 0);

	component contador_bcd_00_99 is
		generic (max_dezena: natural := 5; max_unidade : natural := 9);
		port
		(
        clk, rst: in std_logic;
		  fim : out std_logic;
        bcd_unidade, bcd_dezena : out std_logic_vector(3 downto 0)
		);
	end component;
	
	component bcd2ssd is

		generic (AC_CCN : natural := 0);
		-- AC_CCN = 1 => display de anodo comum
		-- AC_CCN = 0 => display de catodo comum
		port
		(
			bcd_in : in std_logic_vector(3 downto 0);
			ssd_out: out std_logic_vector(6 downto 0)
		);
	end component;
	
begin
	conta_SS : contador_bcd_00_99
		generic map(max_dezena => 5, max_unidade => 9)
		port map
		(
        clk => clk_1sec,
		  rst => rst_sw,
		  fim => open,
        bcd_unidade => bcd_uSS,
		  bcd_dezena => bcd_dSS
		);
		conta_MM : contador_bcd_00_99
		generic map(max_dezena => 5, max_unidade => 9)
		port map
		(
        clk => clk_1sec,
		  rst => rst_sw,
		  fim => open,
        bcd_unidade => bcd_uMM,
		  bcd_dezena => bcd_dMM
		);
		conta_HH : contador_bcd_00_99
		generic map(max_dezena => 2, max_unidade => 3)
		port map
		(
        clk => clk_1sec,
		  rst => rst_sw,
		  fim => open,
        bcd_unidade => bcd_uHH,
		  bcd_dezena => bcd_dHH
		);
		
		-- Conversao de BCD para SSD de todas as saidas dos contadores
		comp_uSS : bcd2ssd port map (bcd_uSS, ssd_uSS);
		comp_dSS : bcd2ssd port map (bcd_dSS, ssd_dSS);
		comp_uMM : bcd2ssd port map (bcd_uMM, ssd_uMM);
		comp_dMM : bcd2ssd port map (bcd_dMM, ssd_dMM);
		comp_uHH : bcd2ssd port map (bcd_uHH, ssd_uHH);
		comp_dHH : bcd2ssd port map (bcd_dHH, ssd_dHH);
		
end architecture;
