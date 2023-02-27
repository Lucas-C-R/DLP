LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
----------------------------------------------------------
ENTITY cata_moedas IS
PORT (
	clk, rst 				: in STD_LOGIC;
	pag5, pag10, pag25	: in std_logic;
	dev5, dev10, prod		: out std_logic
	);
END entity;
----------------------------------------------------------
ARCHITECTURE cm_v1 OF cata_moedas IS
	TYPE state IS (ST0, ST5, ST10, ST15, ST20, ST25, ST30, ST35, ST40, ST45);
	SIGNAL pr_state, nx_state : state;
	-- ATTRIBUTE ENUM_ENCODING : STRING; --optional attribute
	-- ATTRIBUTE ENUM_ENCODING OF state : TYPE IS "sequential";
	-- ATTRIBUTE SYN_ENCODING OF state : TYPE IS "safe";
BEGIN
	------Logica Sequencial da FSM:------------
	PROCESS (clk, rst)
	BEGIN
		IF (rst = '1') THEN
			pr_state <= ST0;
		ELSIF (rising_edge(clk)) THEN
			pr_state <= nx_state;
		END IF;
	END PROCESS;
	
	------Logica Combinacional da FSM:------------
	PROCESS (pr_state, pag5, pag10, pag25)
	BEGIN
				 ------Valores default das saidas------------
		dev5 <= '0';
		dev10 <= '0';
		prod <= '0';
		
		CASE pr_state IS
		WHEN ST0 =>
			IF (pag5 = '1') THEN
				nx_state <= ST5;
			elsif (pag10 = '1') then
				nx_state <= ST10;
			elsif (pag25 = '1') then
				nx_state <= ST25;
			else
				nx_state <= ST0;
			END IF;
			
		WHEN ST5 =>
			IF (pag5 = '1') THEN
				nx_state <= ST10;
			elsif (pag10 = '1') then
				nx_state <= ST15;
			elsif (pag25 = '1') then
				nx_state <= ST30;
			else
				nx_state <= ST5;
			END IF;
			
		WHEN ST10 =>
			IF (pag5 = '1') THEN
				nx_state <= ST15;
			elsif (pag10 = '1') then
				nx_state <= ST20;
			elsif (pag25 = '1') then
				nx_state <= ST35;
			else
				nx_state <= ST10;
			END IF;
			
		WHEN ST15 =>
			IF (pag5 = '1') THEN
				nx_state <= ST20;
			elsif (pag10 = '1') then
				nx_state <= ST25;
			elsif (pag25 = '1') then
				nx_state <= ST40;
			else
				nx_state <= ST15;
			END IF;
			
		WHEN ST20 =>
			IF (pag5 = '1') THEN
				nx_state <= ST25;
			elsif (pag10 = '1') then
				nx_state <= ST30;
			elsif (pag25 = '1') then
				nx_state <= ST45;
			else
				nx_state <= ST20;
			END IF;
			
		WHEN ST25 =>
			prod <= '1' ; -- apenas se diferente do valor default
			nx_state <= ST0;
			
		WHEN ST30 =>
			dev5 <= '1';
			nx_state <= ST25;
			
		WHEN ST35 =>
			dev10 <= '1';
			nx_state <= ST25;
			
		WHEN ST40 =>
			dev5 <= '1';
			nx_state <= ST35;
			
		WHEN ST45 =>
			dev10 <= '1';
			nx_state <= ST35;
			
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