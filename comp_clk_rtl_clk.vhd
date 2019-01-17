--
-- VHDL Architecture fahim_segment_lib.comp_clk.rtl_clk
--
-- Created:
--          by - Fahim.UNKNOWN (DESKTOP-0H08CHI)
--          at - 22:55:08 03/31/2018
--
-- using Mentor Graphics HDL Designer(TM) 2016.1 (Build 8)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY comp_clk IS
  
  
  port( 
 
        clk_o : out std_logic

);
END ENTITY comp_clk;

--
ARCHITECTURE rtl_clk OF comp_clk IS
signal clk: std_logic;

BEGIN
  
  process 
begin 
clk <= '0'; 
wait for 4 ns; 
clk <= '1'; 
wait for 4 ns; 
end process; 
clk_o <= clk;
END ARCHITECTURE rtl_clk;

