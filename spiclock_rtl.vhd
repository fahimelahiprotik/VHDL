--
-- VHDL Architecture fahim_segment_lib.spiclock.rtl
--
-- Created:
--          by - user.UNKNOWN (KTP12R7182)
--          at - 17:36:25 01/05/2018
--
-- using Mentor Graphics HDL Designer(TM) 2016.2 (Build 5)
--
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


ENTITY spiclock IS
   PORT( 
      clk     : IN     STD_LOGIC;
      spi_clk : OUT    STD_LOGIC;
   
      reset   :IN   STD_LOGIC
   );

-- Declarations

END ENTITY spiclock ;


architecture rtl of spiclock is

-- Set Max Count (Determines Length of Time Out) --
    constant max_count : integer := (5);  --------25MHZ clock of SPI -----number of count is 5 ------
    signal counter_q: std_logic_vector (31 downto 0):=(others=>'0') ;
   signal spi_clk_s : std_logic ; 
    
begin

process(clk)
begin
if rising_edge(clk) then
  if(reset='1') then
    counter_q<=(others=>'0');
 else
   if spi_clk_s='1' then
     counter_q<=(others=>'0');
     else
      counter_q<=counter_q+1;
    end if;
   end if ;
  end if ;
-- end if ;
 

 end process;
 spi_clk_s <='1' when counter_q=max_count else '0';
spi_clk<=spi_clk_s;
 end architecture rtl;

 
