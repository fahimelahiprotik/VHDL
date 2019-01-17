--
-- VHDL Architecture fahim_segment_lib.edge.rtl
--
-- Created:
--          by - user.UNKNOWN (KTP12R7182)
--          at - 21:44:29 10/04/2018
--
-- using Mentor Graphics HDL Designer(TM) 2016.2 (Build 5)
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity edge is
   port( 
      din   : in     std_logic;
      reset : in     std_logic;
      clk   : in     std_logic;
      sec_out2  : out    std_logic
     -- fall  : out    std_logic;
      --any   : out    std_logic
   );

-- Declarations

end entity edge ;

--
architecture rtl of edge is
  signal qd_0,qd_1: std_logic:='0';
  signal reset_q : std_logic:='1';
begin
------------------------------------------- 
  qd_0 <= din;
------------------------------------------  
  process(clk)
  begin
    if rising_edge(clk) then
      if reset='1' then
          reset_q <= '0';
        else
          reset_q <= '1';
          qd_1 <= qd_0;      
    end  if; 
  end if;     
  end process;

-------------------------------------------
  --rise <= (qd_0 and not qd_1);
    sec_out2 <= (not qd_0 and qd_1)and reset_q ;
 -- any  <= (rise xor fall) and reset_q ;and reset_q--------------------------------- 

  
                     
end architecture rtl;


