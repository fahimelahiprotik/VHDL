--
-- VHDL Architecture fahim_segment_lib.seccount.rtl
--
-- Created:
--          by - Fahim.UNKNOWN (DESKTOP-0H08CHI)
--          at - 23:39:12 04/ 9/2018
--
-- using Mentor Graphics HDL Designer(TM) 2016.1 (Build 8)
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity seccount is
   port( 
      clk      : in     std_logic;
      reset    : in     std_logic;
      sec_out1 : out    std_logic
   );

-- Declarations

end entity seccount ;
  
architecture rtl of seccount is
  
signal count: integer:=1;
signal tmp : std_logic := '0';
  
begin
  
process(clk)
begin
if(reset='1') then
count<=1;
tmp<='0';
elsif(clk'event and clk='1') then
count <=count+1;
if (count = 124) then
tmp <= NOT tmp;
count <= 1;
end if;
end if;
sec_out1 <= tmp;
end process;
  
end architecture rtl;
