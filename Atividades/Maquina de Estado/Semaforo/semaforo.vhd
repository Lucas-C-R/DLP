LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
----------------------------------------------------------
ENTITY semaforo IS
generic(
	tVd1	: integer := 10; 
	tVd2	: integer := 5;
	tAm	: integer := 2;
	MAX	: integer := 10);
PORT (
	clk, rst 	: IN STD_LOGIC;
	ativar 		: IN std_logic;
	Lvm1, Lvm2	: out std_logic;
	Lam1, Lam2	: out std_logic;
	Lvd1, Lvd2	: out std_logic);
END entity;
----------------------------------------------------------
ARCHITECTURE sem_v1 OF semaforo IS
	TYPE state IS (AM1, AM2, VD1VM2, AM1VM2, VM1VD2, VM1AM2);
	SIGNAL pr_state, nx_state : state;
   signal timer: integer range 0 to MAX;
--	ATTRIBUTE ENUM_ENCODING : STRING; --optional attribute
--	ATTRIBUTE ENUM_ENCODING OF state : TYPE IS "sequential";
BEGIN
	------Logica Sequencial da FSM:------------
	PROCESS (clk, rst)
		variable count: integer range 0 to MAX;
	BEGIN
		IF (rst = '1') THEN
			pr_state <= AM1;
			count := 0;
		ELSIF (rising_edge(clk)) THEN
			count := count + 1;
			if (count >= timer) then
				pr_state <= nx_state;
				count := 0;
			end if;
		END IF;
	END PROCESS;
	
	------Logica Combinacional da FSM:------------
	PROCESS (pr_state, ativar)
	BEGIN
                ------Valores default das saidas------------
                Lvm1 <= '0'; 
					 Lvm2 <= '0';
					 Lam1 <= '0'; 
					 Lam2 <= '0';
					 Lvd1 <= '0';
					 Lvd2 <= '0';
                ------Valores default do timer------------
		timer <= 1;
		CASE pr_state IS
			WHEN AM1 =>
				Lam1 <= '1';   -- apenas se diferente do valor default
				IF (ativar = '1') THEN
					nx_state <= VD1VM2;
				ELSE
					timer <= tAm; -- apenas se diferente do valor default
					nx_state <= AM2;
				END IF;
				
			WHEN AM2 =>
				Lam2 <= '1'; -- apenas se diferente do valor default
				timer <= tAm;  -- apenas se diferente do valor default
				nx_state <= AM1;
				
			WHEN VD1VM2 =>
				Lvd1 <= '1';
				Lvm2 <= '1';
				IF (ativar = '0') THEN
					nx_state <= AM1;
				ELSE
					timer <= tVd1;
					nx_state <= AM1VM2;
				END IF;
				
			WHEN AM1VM2 =>
				Lam1 <= '1';
				lvm2 <= '1';	
				timer <= tAm;  
				nx_state <= VM1VD2;
				
			WHEN VM1VD2 =>
				Lvm1 <= '1';
				Lvd2 <= '1';
				IF (ativar = '0') THEN
					nx_state <= AM1;
				ELSE
					timer <= tVd2;
					nx_state <= VM1AM2;
				END IF;
				
			WHEN VM1AM2 =>
				Lvm1 <= '1';
				lam2 <= '1';	
				timer <= tAm;  
				nx_state <= VD1VM2;
		END CASE;
	END PROCESS;
END architecture;