library ieee;
use ieee.std_logic_1164.all;

entity tri_state is
  generic (N: NATURAL := 4);
  port 
  (
    input      : in std_logic_vector(N-1 downto 0);
    ena        : in std_logic;
    output     : out std_logic_vector(N-1 downto 0)
  );
end entity;

architecture tri_state of tri_state is
	constant all_Z : std_logic_vector(N-1 downto 0) := (others => 'Z');	-- um std_logic_vector, onde todos os "N-1" valores recebem Z (alta impedancia)
begin
  output <= input when ena = '1' else all_Z;										-- esse "else all_z" pode ser substituido por "(others => 'Z')"
end architecture;