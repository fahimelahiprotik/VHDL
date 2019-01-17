--
-- VHDL Architecture fahim_segment_lib.minandhouragain.rtl
--
-- Created:
--          by - user.UNKNOWN (KTP12R7182)
--          at - 23:21:01 30/04/2018
--
-- using Mentor Graphics HDL Designer(TM) 2016.2 (Build 5)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
entity minandhouragain is
   port(
    clk: in std_logic;
  --  reset : in std_logic;
    sec_pulse: in std_logic;
    sec : out std_logic_vector(7 downto 0) ;
    min: out std_logic_vector(7 downto 0);
    hour: out std_logic_vector(7 downto 0)
    );
end entity minandhouragain;

--
architecture rtl of minandhouragain is

      signal second_cnt :  std_logic_vector(7 downto 0) :=(others=>'0') ;
    signal minute_cnt:  std_logic_vector(7 downto 0):=(others=>'0');
    signal hour_cnt:  std_logic_vector(7 downto 0):=(others=>'0');
    constant  max : integer :=59 ;----min and sec-------
    constant   max_h  : integer :=11 ;-----hour format-----
begin
  process(clk)
  begin
    if rising_edge(clk) then
   
        ------------------------seccount start counting--------------
      if sec_pulse='1' then
       second_cnt<=second_cnt+1;
       if second_cnt=max then
         second_cnt<=(others=>'0');
         minute_cnt<=minute_cnt+1;
         ----------------------------------
         if minute_cnt=max then
           minute_cnt<=(others=>'0');
           hour_cnt<=hour_cnt+1;
           ----------------------------------
           if hour_cnt=max_h then
             hour_cnt<=(others=>'0');
           end if;
        end if;
       end if;
     end if;
    end if;
---    end if;
end process;
  sec<=second_cnt;
  min<=minute_cnt;
  hour<=hour_cnt;
end architecture rtl;

