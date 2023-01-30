-----------------------------------------------------------------------
-- <Writers_Name>
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- <File_Name>
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains a simple VHDL testbench for the
-- edge-triggered flip-flop with parallel access and reset.
--
--
-- <Notes>
-----------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity <test_bench_name> is
  generic(gCLK_HPER   : time := 50 ns);
end <test_bench_name>;

architecture behavior of <test_bench_name> is
  
  -- Calculate the clock period as twice the half-period
  constant cCLK_PER  : time := gCLK_HPER * 2;


  component <dut_component_name>
    port(i_CLK        : in std_logic;     -- Clock input
         i_RST        : in std_logic;     -- Reset input
         i_WE         : in std_logic;     -- Write enable input
         i_D          : in std_logic;     -- Data value input
         o_Q          : out std_logic);   -- Data value output
  end component;

  -- Temporary signals to connect to the dff component.
  signal s_CLK, s_RST, s_WE  : std_logic;
  signal s_D, s_Q : std_logic;

begin

  DUT: <dut_component_name> 
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