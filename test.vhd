-----------------------------------------------------------------------
-- Coby Konkol
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- test.vhd
-------------------------------------------------------------------------
-- DESCRIPTION:Description
--
--
-- Notes
-----------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity tb_comp is
  generic(gCLK_HPER   : time := 50 ns);
end tb_comp;

architecture behavior of tb_comp is
  
  -- Calculate the clock period as twice the half-period
  constant cCLK_PER  : time := gCLK_HPER * 2;


  component comp
    port(i_d0: std_logic);
);   -- Data value output
  end component;

  -- Temporary signals to connect to the dff component.
  signal s_CLK, s_RST, s_WE  : std_logic;

  signal s_id0: std_logic := '0';



begin

  DUT: comp 
  port map(<dut_port_mapping>);

  -- This process sets the clock value (low for gCLK_HPER, then high
  -- for gCLK_HPER). Absent a "wait" command, processes restart 
  -- at the beginning once they have reached the final statement.
  P_CLK: process
  begin
    s_CLK <= '0';
    wait for gCLK_HPER;
    s_CLK <= '1';
    wait for gCLK_HPER;
  end process;
  
  -- Testbench process  
  P_TB: process
  begin

  wait;
  end process;
  
end behavior;
