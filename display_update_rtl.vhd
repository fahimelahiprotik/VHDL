--
-- VHDL Architecture fahim_segment_lib.display_update.rtl
--
-- Created:
--          by - user.UNKNOWN (KTP12R7182)
--          at - 17:42:28 01/05/2018
--
-- using Mentor Graphics HDL Designer(TM) 2016.2 (Build 5)

--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


ENTITY display_update IS
   PORT( 
      clk     : IN     STD_LOGIC;
      disp_up : OUT    STD_LOGIC;
   
      reset   :IN   STD_LOGIC
   );

-- Declarations

END ENTITY display_update ;


architecture rtl of display_update is

-- Set Max Count (Determines Length of Time Out) --
    constant max_count : integer := (2000000);  --------16ms period refresh rate 
    signal counter_q: std_logic_vector (31 downto 0):=(others=>'0') ;
   signal disp_up_s : std_logic ; 
    
begin

process(clk)
begin
if rising_edge(clk) then
  if(reset='1') then
    counter_q<=(others=>'0');
 else
   if disp_up_s='1' then
     counter_q<=(others=>'0');
     else
      counter_q<=counter_q+1;
    end if;
   end if ;
  end if ;
-- end if ;
 

 end process;
 disp_up_s <='1' when counter_q=max_count else '0';
disp_up<=disp_up_s;
 end architecture rtl;

 
