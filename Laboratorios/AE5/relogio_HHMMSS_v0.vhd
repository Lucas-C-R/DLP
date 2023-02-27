library ieee;
use ieee.std_logic_1164.all;

entity relogio_HHMMSS_v0 is

    port
    (
        clk_placa, rst_sw, ligar_sw: in std_logic;
		  clk_1sec : out std_logic;
		  ssd_uSS, ssd_dSS: out std_logic_vector(6 downto 0);
		  ssd_uMM, ssd_dMM: out std_logic_vector(6 downto 0);
		  ssd_uHH, ssd_dHH: out std_logic_vector(6 downto 0)
    );
end entity;

architecture rlg_v1 of relogio_HHMMSS_v0 is

	signal bcd_uSS, bcd_dSS: std_logic_vector(3 downto 0);
	signal bcd_uMM, bcd_dMM: std_logic_vector(3 downto 0);
	signal bcd_uHH, bcd_dHH: std_logic_vector(3 downto 0);
	signal clk_sec, clk_min, clk_hr : std_logic;

	component contador_bcd is
		generic (max_dezena: natural := 5; max_unidade : natural := 9);
		port
		(
        clk, rst, ena: in std_logic;
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
	
	component div_clk_v0 is
		generic (fclk : natural := 50); 		
		port
		(
			clk_in, rst, ena : in std_logic;
			clk_out : out std_logic
		);
	end component;
	
begin

-- Gera clock de 1 segundo
	gera_1sec : div_clk_v0
		generic map (fclk => 5)
		port map (
		rst => rst_sw,
		clk_in => clk_placa,
		ena => ligar_sw,
		clk_out => clk_sec
		);

	clk_1sec <= clk_sec;

	conta_SS : contador_bcd
		generic map(max_dezena => 5, max_unidade => 9)
		port map
		(
        clk => clk_sec,
		  ena => ligar_sw,
		  rst => rst_sw,
		  fim => clk_min,
        bcd_unidade => bcd_uSS,
		  bcd_dezena => bcd_dSS
		);
		
		conta_MM : contador_bcd
		generic map(max_dezena => 5, max_unidade => 9)
		port map
		(
        clk => clk_min,
		  ena => ligar_sw,
		  rst => rst_sw,
		  fim => clk_hr,
        bcd_unidade => bcd_uMM,
		  bcd_dezena => bcd_dMM
		);
		
		conta_HH : contador_bcd
		generic map(max_dezena => 2, max_unidade => 3)
		port map
		(
        clk => clk_hr,
		  ena => ligar_sw,
		  rst => rst_sw,
		  fim => open,
        bcd_unidade => bcd_uHH,
		  bcd_dezena => bcd_dHH
		);
		
		-- Conversao de BCD para SSD de todas as saidas dos contadores
		comp_uSS : bcd2ssd generic map(1) port map (bcd_uSS, ssd_uSS);
		comp_dSS : bcd2ssd generic map(1) port map (bcd_dSS, ssd_dSS);
		
		comp_uMM : bcd2ssd generic map(1) port map (bcd_uMM, ssd_uMM);
		comp_dMM : bcd2ssd generic map(1) port map (bcd_dMM, ssd_dMM);
		
		comp_uHH : bcd2ssd generic map(1) port map (bcd_uHH, ssd_uHH);
		comp_dHH : bcd2ssd generic map(1) port map (bcd_dHH, ssd_dHH);
		
end architecture;
