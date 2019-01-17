--
-- VHDL Architecture fahim_segment_lib.BCD.rtl
--
-- Created:
--          by - user.UNKNOWN (KTP12R7182)
--          at - 14:20:01 04/04/2018
--
-- using Mentor Graphics HDL Designer(TM) 2016.2 (Build 5)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity BCD is
  port (
       clk             : IN   STD_LOGIC;
       sec_cnt         : IN   STD_LOGIC_VECTOR(7 downto 0);
       min_cnt         : IN   STD_LOGIC_VECTOR(7 downto 0);
       hour_cnt        : IN   STD_LOGIC_VECTOR(7 downto 0);
       sec_dig1        : OUT  STD_LOGIC_VECTOR(3 downto 0);
       sec_dig2        : OUT  STD_LOGIC_VECTOR(3 downto 0);
       min_dig1        : OUT  STD_LOGIC_VECTOR(3 downto 0);
       min_dig2        : OUT  STD_LOGIC_VECTOR(3 downto 0);
       hour_dig1       : OUT  STD_LOGIC_VECTOR(3 downto 0);
       hour_dig2       : OUT  STD_LOGIC_VECTOR(3 downto 0)
    );
    
end entity BCD;

--
architecture rtl of BCD is
  ----------process for seconds to convert into sec_dig1 and sec_dig2--------applying double dabble algorithm--------------
begin
 process (clk)
  variable G : STD_LOGIC_VECTOR (12 downto 0);
  begin
    for i in 0 to 12 loop
      G(i):='0';
    end loop ;
    G(8 downto 3):=sec_cnt(5 downto 0);
    for i in 0 to 2 loop 
      if G(9 downto 6)> "0100" then
        G(9 downto 6) := G(9 downto 6)+"0011";
        end if;
        G(12 downto 1):=G(11 downto 0);
        end loop;
        sec_dig1<=G(9 downto 6) ;
        sec_dig2<="0"&G(12 downto 10);
      end process ;
       ----------process for seconds to convert into min_dig1 and min_dig2--------

 process (clk)
  variable M : STD_LOGIC_VECTOR (12 downto 0);
  begin
    for i in 0 to 12 loop
      M(i):='0';
    end loop ;
    M(8 downto 3):=min_cnt(5 downto 0);
    for i in 0 to 2 loop 
      if M(9 downto 6)> "0100" then
        M(9 downto 6) := M(9 downto 6)+"0011";
        end if;
        M(12 downto 1):=M(11 downto 0);
        end loop;
        min_dig1 <=M(9 downto 6) ;
        min_dig2 <="0"&M(12 downto 10);
      end process ;
      ----------process for seconds to convert into hour_dig1 and hour_dig2--------
      process (clk)
  variable H : STD_LOGIC_VECTOR (12 downto 0);
  begin
    for i in 0 to 12 loop
      H(i):='0';
    end loop ;
    H(7 downto 3):=hour_cnt(4 downto 0);
    for i in 0 to 2 loop 
      if H(8 downto 5)> "0100" then
        H(8 downto 5) := H(8 downto 5)+"0011";
        end if;
        H(10 downto 1):=H(9 downto 0);
        end loop;
        hour_dig1 <=H(8 downto 5) ;
        hour_dig2 <="00"&H(10 downto 9);
      end process ;
end architecture rtl;

