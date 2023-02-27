LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity counter is
  generic (WIDTH : in natural := 4);
  port (
    RST   : in std_logic;
    CLK   : in std_logic;
    LOAD  : in std_logic;
    DATA  : in std_logic_vector(WIDTH-1 downto 0);
    R0	 : out std_logic;
    Q     : out std_logic_vector(WIDTH-1 downto 0));
end entity;

architecture ifsc_v1 of counter is
	signal Q_aux : std_logic_vector(WIDTH-1 downto 0);
begin
  process(RST,CLK) is
  begin
    if RST = '1' then
      Q_aux <= (others => '0');
    elsif rising_edge(CLK) then
      if LOAD= '1' then
        Q_aux <= DATA;
      else
        Q_aux <= std_logic_vector(unsigned(Q_aux) + 1);
      end if;
    end if;
  end process;
  -- Adaptacao feita devido a matriz de leds acender com ZERO
  Q <= not Q_aux;
  -- Para acender um led eh necessario colocar ZERO na linha correspondente da matriz.
  R0 <= '0';
end architecture;