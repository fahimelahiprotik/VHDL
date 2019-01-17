--
-- VHDL Architecture fahim_segment_lib.g_clock1.rtl
--
-- Created:
--          by - user.UNKNOWN (KTP12R7182)
--          at - 19:30:55 29/04/2018
--
-- using Mentor Graphics HDL Designer(TM) 2016.2 (Build 5)
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


ENTITY g_clock1 IS
   PORT( 
      clk     : IN     STD_LOGIC;
      sec_pulse : OUT    STD_LOGIC;
   
      reset   :IN   STD_LOGIC
   );

-- Declarations

END ENTITY g_clock1 ;


architecture rtl of g_clock1 is

-- Set Max Count (Determines Length of Time Out) --
    constant max_count : integer := (124999999);  
    signal counter_q: std_logic_vector (31 downto 0):=(others=>'0') ;
   signal sec_pulse_s: std_logic ; 
    
begin

process(clk)
begin
if rising_edge(clk) then
  if(reset='1') then
    counter_q<=(others=>'0');
 else
   if sec_pulse_s='1' then
     counter_q<=(others=>'0');
     else
      counter_q<=counter_q+1;
    end if;
   end if ;
  end if ;
-- end if ;
 

 end process;
 sec_pulse_s <='1' when counter_q=max_count else '0';
sec_pulse<=sec_pulse_s;
     -----This sec_pulse actaually the second pulse which i want to count for min-------
 end architecture rtl;

 
