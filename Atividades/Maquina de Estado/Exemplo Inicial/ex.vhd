LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
----------------------------------------------------------
ENTITY ex IS
PORT (
	clk, rst : IN STD_LOGIC;
	x : IN integer range 0 to 2;
	y : OUT std_logic
	);
END entity;
----------------------------------------------------------
ARCHITECTURE mde_v1 OF ex IS
	TYPE state IS (A, B, C);
	SIGNAL pr_state, nx_state : state;
	-- ATTRIBUTE ENUM_ENCODING : STRING; --optional attribute
	-- ATTRIBUTE ENUM_ENCODING OF state : TYPE IS "sequential";
	-- ATTRIBUTE SYN_ENCODING OF state : TYPE IS "safe";
BEGIN
	------Logica Sequencial da FSM:------------
	PROCESS (clk, rst)
	BEGIN
		IF (rst = '1') THEN
			pr_state <= A;
		ELSIF (rising_edge(clk)) THEN
			pr_state <= nx_state;
		END IF;
	END PROCESS;
	
	------Logica Combinacional da FSM:------------
	PROCESS (pr_state, x)
	BEGIN
                ------Valores default das saidas------------
--                output <= < value > ;
		CASE pr_state IS
			WHEN A =>
				y <= '0' ;   -- apenas se diferente do valor default
				IF (x = 2) THEN
					nx_state <= B;
				ELSE
					nx_state <= A;
				END IF;
				
			WHEN B =>
				y <= '0' ; -- apenas se diferente do valor default
				IF (x = 0) THEN
					nx_state <= C;
				ELSIF (x = 1) THEN
					nx_state <= A;
				ELSE
					nx_state <= B;
				END IF;
				
			WHEN C =>
				y <= '1' ; -- apenas se diferente do valor default
				IF (x = 1) THEN
					nx_state <= A;
				ELSE
					nx_state <= C;
				END IF;
		END CASE;
	END PROCESS;
	
	------Seção de Saída (opcional):-------
--	PROCESS (clk, rst)
--	BEGIN
--		IF (rst = '1') THEN
--			new_output <= < value > ;
--		ELSIF (clk'EVENT AND clk = '1') THEN --or clk='0'
--			new_output <= output;
--		END IF;
--	END PROCESS;
END architecture;