-- VHDL Architecture fahim_segment_lib.segmentcounter.rtl
--
-- Created:
--          by - Fahim.UNKNOWN (DESKTOP-0H08CHI)
--          at - 20:06:41 03/29/2018
--
-- using Mentor Graphics HDL Designer(TM) 2016.1 (Build 8)
--
-- hds interface_start
LIBRARY ieee;
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--use IEEE.NUMERIC_STD.ALL;
ENTITY segmentcounter IS
   GENERIC( 
      clock_g : integer := 32;
      nbits_g : integer := 8
   );
   PORT( 
      clk     : IN     std_logic;
      reset   : IN     std_logic;
      sec_o   : OUT    std_logic;
      seconds : OUT    std_logic_vector (clock_g-1 DOWNTO 0);
      minutes : OUT    std_logic_vector (nbits_g-1 DOWNTO 0);
      hours   : OUT    std_logic_vector (nbits_g-1 DOWNTO 0)
   );

-- Declarations

END segmentcounter ;
-- hds interface_end
--
ARCHITECTURE rtl OF segmentcounter IS
  
  --- signal tc_q  : std_logic:='0';
  ---- signal sec_q : std_logic_vector(nbits_g-1 downto 0):=(others => '0'); 
   signal sec_cnt   : std_logic_vector(clock_g-1 downto 0) :=(others => '0'); 
 --  signal min_cnt   : std_logic_vector(clock_g-1 downto 0) :=(others => '0');
 --  signal hour_cnt   : std_logic_vector(clock_g-1 downto 0) :=(others => '0');  
 --   signal sec,min,hour : integer range 0 to 60 :=0;
      signal sec : std_logic:='0';
begin
--seconds <= conv_std_logic_vector(sec,nbits_g);
--minutes <= conv_std_logic_vector(min,nbits_g);
--hours <= conv_std_logic_vector(hour,nbits_g);

process
begin 
  
    if rising_edge(clk) then
      
      if reset = '1' then
      sec_cnt<=(others=>'0');
   --   min_cnt<=(others=>'0');
  --    hour_cnt<=(others=>'0');
    else
       sec_cnt<=sec_cnt+1;
     --  sec<='0' ;
     if (sec_cnt<=conv_std_logic_vector(124999999,clock_g)) then
        sec_cnt<="00000000000000000000000000000001" ;
       --- sec_cnt<=(others=>'0');
--         elsif sec=59 and sec=1 then
--           sec_cnt<=(others=>'0');
--             min<=1;
--             min_cnt<=min_cnt+1;
            -- 
--             elsif min=59 and min=1 then
--               min_cnt<=(others=>'0');
--               hour<=1;
--               hour_cnt<=hour_cnt+1;
--                elsif hour=23 and hour =1 then
--                 hour_cnt<=(others=>'0');
        
          end if;
      end if;
   end if; 
end process;

seconds  <= sec_cnt;
END ARCHITECTURE rtl;
