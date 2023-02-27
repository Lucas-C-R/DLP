LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY registered_comp_add_v1 IS
  PORT (clk: IN STD_LOGIC;
   a, b: IN INTEGER RANGE 0 TO 7;
   reg_comp: OUT STD_LOGIC;
   reg_sum: OUT INTEGER RANGE 0 TO 15);
 END ENTITY;

 ARCHITECTURE ifsc_v1 OF registered_comp_add_v1 IS
  SIGNAL comp: STD_LOGIC;
  SIGNAL sum: INTEGER RANGE 0 TO 15;
 BEGIN
  comp <= '1' WHEN a>b ELSE '0';
  sum <= a + b;
  PROCESS (clk)
  BEGIN
   IF (clk'EVENT AND clk='1') THEN
    reg_comp <= comp;
    reg_sum <= sum;
   END IF;
  END PROCESS;
 END ARCHITECTURE;