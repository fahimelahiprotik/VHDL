--
-- VHDL Architecture fahim_segment_lib.sliders.rtl
--
-- Created:
--          by - user.UNKNOWN (KTP12R7182)
--          at - 01:07:45 01/05/2018
--
-- using Mentor Graphics HDL Designer(TM) 2016.2 (Build 5)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity sliders is
  PORT( 
      clk       : IN     STD_LOGIC;
      Sliders   : IN     STD_LOGIC_VECTOR (1 DOWNTO 0);
      sec_dig1  : IN     STD_LOGIC_VECTOR (3 DOWNTO 0);
      sec_dig2  : IN     STD_LOGIC_VECTOR (3 DOWNTO 0);
      min_dig1  : IN     STD_LOGIC_VECTOR (3 DOWNTO 0);
      min_dig2  : IN     STD_LOGIC_VECTOR (3 DOWNTO 0);
      hour_dig1 : IN     STD_LOGIC_VECTOR (3 DOWNTO 0);
      hour_dig2 : IN     STD_LOGIC_VECTOR (3 DOWNTO 0);
      d0        : OUT    STD_LOGIC_VECTOR (3 DOWNTO 0);
      d1        : OUT    STD_LOGIC_VECTOR (3 DOWNTO 0);
      d2        : OUT    STD_LOGIC_VECTOR (3 DOWNTO 0);
      d3        : OUT    STD_LOGIC_VECTOR (3 DOWNTO 0)
   );

end entity sliders;

--


  ARCHITECTURE rtl OF slideraction IS
BEGIN
  process(clk)
  begin
  if rising_edge(clk) then
    If Sliders(0)='0' then
      
        d3<=min_dig1;
        d2<=min_dig2;
        d1<=sec_dig1;
        d0<=sec_dig2;
      else 
        
        d3<=hour_dig1;
        d2<=hour_dig2;
        d1<=min_dig1;
        d0<=min_dig2;
     
     
    end if;
    end if;
end process;
END ARCHITECTURE rtl;
