-- VHDL Entity fahim_segment_lib.spiseven.symbol
--
-- Created:
--          by - user.UNKNOWN (KTP12R7182)
--          at - 15:48:15 01/05/2018
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2016.2 (Build 5)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity spiseven is
   port( 
      clk       : in     std_logic;
      disp_up   : in     std_logic;
      reset     : in     std_logic;
      sdata_in  : in     std_logic_vector (31 downto 0);
      spi_clk   : in     std_logic;
      sclk_out  : out    std_logic;
      sdata_out : out    std_logic;
      sync_out  : out    std_logic
   );

-- Declarations

end spiseven ;

--
-- VHDL Architecture fahim_segment_lib.spiseven.fsm
--
-- Created:
--          by - user.UNKNOWN (KTP12R7182)
--          at - 15:49:05 01/05/2018
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2016.2 (Build 5)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
 
architecture fsm of spiseven is

   -- Architecture Declarations
   signal txreg0 : std_logic_vector(31 downto 0);
   signal bit_cnt: std_logic_vector(7 downto 0);
   signal disp_up_load: std_logic;
   signal sclk_tmp, sync_tmp: std_logic;

   type state_type is (
      s_wait,
      s0,
      s1,
      s_end
   );
 
   -- Declare current and next state signals
   signal current_state : state_type;
   signal next_state : state_type;

begin

   -----------------------------------------------------------------
   clocked_proc : process ( 
      clk
   )
   -----------------------------------------------------------------
   begin
      if (clk'event and clk = '1') then
         if (spi_clk = '1') then
            if (reset = '1') then
               current_state <= s_wait;
            else
               current_state <= next_state;

               -- Combined Actions
               case current_state is
                  when s_wait => 
                     if (disp_up_load = '1') then 
                        txreg0 <= sdata_in;
                        sclk_tmp <= '1';
                        sync_tmp <= '0';
                        bit_cnt <= (others => '0');
                     end if;
                  when s0 => 
                     sclk_tmp <= '0';
                  when s1 => 
                     if (bit_cnt = 31) then 
                        sync_tmp <= '1';
                     else
                        sclk_tmp <= '1';
                        txreg0 <= txreg0(txreg0'left -1 downto 0) & '0';
                        bit_cnt <= bit_cnt + 1;
                     end if;
                  when others =>
                     null;
               end case;
            end if;
         end if;
      end if;
   end process clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : process ( 
      bit_cnt,
      current_state,
      disp_up_load
   )
   -----------------------------------------------------------------
   begin
      case current_state is
         when s_wait => 
            if (disp_up_load = '1') then 
               next_state <= s0;
            else
               next_state <= s_wait;
            end if;
         when s0 => 
            next_state <= s1;
         when s1 => 
            if (bit_cnt = 31) then 
               next_state <= s_end;
            else
               next_state <= s0;
            end if;
         when s_end => 
            next_state <= s_wait;
         when others =>
            next_state <= s_wait;
      end case;
   end process nextstate_proc;
 
   -- Concurrent Statements
   disp_up_load <= disp_up;
   sdata_out <= txreg0(txreg0'left );
   sclk_out <= sclk_tmp;
   sync_out <= sync_tmp;
end fsm;
