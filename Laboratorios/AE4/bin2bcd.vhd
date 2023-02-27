library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin2bcd is
	port 
	(
		A      			: in std_logic_vector (13 downto 0);				-- Entrada ¨A¨ que representara 9999 em binario
		sm, sc, sd, su : out std_logic_vector (3 downto 0)					-- Saidas que representam o milhar, centena, dezena e unidade
	);
end entity;

-- Versao com tempo de propagacao de 106.985, porem utilizando 908 elementos logicos
architecture ifsc_v1 of bin2bcd is
	signal A_uns          					  : unsigned (13 downto 0);
	signal sm_uns, sc_uns, sd_uns, su_uns : unsigned (3 downto 0);		-- Cada sinal so precisa armazenar um valor entre 0 e 9
begin																						-- Como se trata de um hardware, nao de um software, a ordem das instrucoes nao importa
	sm 	 <= std_logic_vector(sm_uns);
	sc		 <= std_logic_vector(sc_uns);
	sd     <= std_logic_vector(sd_uns);
	su     <= std_logic_vector(su_uns);
	
	-- x REM y = x - (x/y) * y -> retorna o resto da divisao x/y
	sm_uns <= resize(((A_uns / 10) / 10) / 10, 4);							-- Obtem o valor do milhar de A_uns
	sc_uns <= resize((A_uns - resize(sm_uns, 14) * 1000) / 100, 4);	-- Realiza a operacao A_uns REM 1000 e depois divide por 100, para pegar a penas a centena
	sd_uns <= resize((A_uns - ((A_uns / 10) / 10) * 100) / 10, 4);		-- Realiza a operacao A_uns REM 100 e depois divide por 10, para pegar apenas a dezena
	su_uns <= resize(A_uns - (A_uns / 10) * 10, 4);				  			-- Realiza a operacao A_uns REM 10, para pegar o resto da divisao, que eh o valor da unidade
	A_uns  <= unsigned(A);															-- ¨A_uns¨ vai receber o valor contido na entrada ¨A¨, desconsiderando a possibiliade de um numero negativo
end architecture;

architecture ifsc_v2 of bin2bcd is
	signal A_uns          					  : unsigned (13 downto 0);
	signal sm_uns, sc_uns, sd_uns, su_uns : unsigned (3 downto 0);		
	signal aux1									  : unsigned (9 downto 0);
	signal aux2									  : unsigned (6 downto 0);
begin																						
	sm 	 <= std_logic_vector(sm_uns);
	sc		 <= std_logic_vector(sc_uns);
	sd     <= std_logic_vector(sd_uns);
	su     <= std_logic_vector(su_uns);
	
	aux1	 <= resize(A_uns / 10, 10); 			-- 1234 / 10			-> 123
	aux2 	 <= resize(aux1 / 10, 7);				-- 123 / 10				-> 12
	
	sm_uns <= resize(aux2 / 10, 4);				-- 12 / 10				-> 1								
	sc_uns <= resize(aux2 - sm_uns * 10, 4);	-- 12 - 1 * 10 		-> 2
	sd_uns <= resize(aux1 - aux2 * 10, 4);		-- 123 - 12 * 10 		-> 3
	su_uns <= resize(A_uns - aux1 * 10, 4);	-- 1234 - 123 * 10	-> 4		  			
	A_uns  <= unsigned(A);							-- 1234								
end architecture;

configuration bin2bcd_cfg of bin2bcd is
--	for ifsc_v1 end for;
	for ifsc_v2 end for;
end configuration;