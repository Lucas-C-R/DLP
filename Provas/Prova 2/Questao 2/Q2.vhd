library ieee;
use ieee.std_logic_1164.all;

entity Q2 is
	generic
	(
		N	: natural  :=	4
	);
	port
	(
		rst_in	:	in	std_logic;
		clk_in	:	in	std_logic;
		IN1_in	:	in std_logic_vector(N-1 downto 0);
		IN2_in	:	in	std_logic_vector(N-1 downto 0);
		OP_in		:	in	std_logic_vector(0 downto 0);

		SUM_reg	:	out std_logic_vector(N-1 downto 0)
	);
end entity;

architecture hier_v1 of Q2 is
	signal IN1_aux, IN2_aux, SUM_aux : std_logic_vector(SUM_reg'range);
	signal OP_aux : std_logic_vector(OP_in'range);
	
	component COMP1 is
		generic
		(
			N	: natural  :=	4
		);
		port
		(
			IN1	:	in	std_logic_vector(N-1 downto 0);
			IN2	:	in	std_logic_vector(N-1 downto 0);
			OP		:	in	std_logic_vector(0 downto 0);

			SUM	: out	std_logic_vector(N-1 downto 0)
		);
	end component;
	
	component COMP2 is
		generic
		(
			N	: natural  :=	4
		);
		port
		(
			rst	:	in	std_logic;
			clk	:	in	std_logic;
			X		:	in std_logic_vector(N-1 downto 0);

			Y		:	out std_logic_vector(N-1 downto 0)
		);
	end component;
begin
	C2 : COMP2
		generic map(N => N)
		port map
		(
			rst => rst_in,
			clk => clk_in,
			X	 => IN1_in, 

			Y	 => IN1_aux
		);
		
		C3 : COMP2
		generic map(N => N)
		port map
		(
			rst => rst_in,
			clk => clk_in,
			X	 => IN2_in, 

			Y	 => IN2_aux
		);
		
		C5 : COMP2
		generic map(N => 1)
		port map
		(
			rst => rst_in,
			clk => clk_in,
			X	 => OP_in, 

			Y	 => OP_aux
		);
		
		C1 : COMP1
		generic map(N => N)
		port map
		(
			IN1 => IN1_aux,
			IN2 => IN2_aux,
			OP  => OP_aux,

			SUM => SUM_aux
		);
		
		C4 : COMP2
		generic map(N => N)
		port map
		(
			rst => rst_in,
			clk => clk_in,
			X	 => SUM_aux, 

			Y	 => SUM_reg
		);
end architecture;
