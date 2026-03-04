-------------------------------------------------------------------------------
-- File        : bufr_demo_entity.vhd
-- Description : BUFR Division Demonstration for Xilinx 7-Series
--               Demonstrates BUFR clock division capabilities from BYPASS to /8
-- Target      : Spartan-7 (Arty S7-50)
-- Author      : Auto-generated
-- Date        : 2026-03-01
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY unisim;
USE unisim.vcomponents.ALL;

-------------------------------------------------------------------------------
-- Entity Declaration
-------------------------------------------------------------------------------
ENTITY bufr_demo IS
  GENERIC (
    g_sim_mode : boolean := false
  );
  PORT (
    -- Clock and Reset
    i_clk_100mhz : IN  std_logic;
    i_rst_n      : IN  std_logic;
    -- PMOD Output Pins (directly drive divided clocks for scope observation)
    o_clk_bypass : OUT std_logic;
    o_clk_div1   : OUT std_logic;
    o_clk_div2   : OUT std_logic;
    o_clk_div3   : OUT std_logic;
    o_clk_div4   : OUT std_logic;
    o_clk_div5   : OUT std_logic;
    o_clk_div6   : OUT std_logic;
    o_clk_div7   : OUT std_logic;
    o_clk_div8   : OUT std_logic
  );
END ENTITY bufr_demo;

-------------------------------------------------------------------------------
-- RTL Architecture
-------------------------------------------------------------------------------
ARCHITECTURE rtl OF bufr_demo IS

  ---------------------------------------------------------------------------
  -- Signal Declarations
  ---------------------------------------------------------------------------
  SIGNAL s_clk_bypass : std_logic;
  SIGNAL s_clk_div1   : std_logic;
  SIGNAL s_clk_div2   : std_logic;
  SIGNAL s_clk_div3   : std_logic;
  SIGNAL s_clk_div4   : std_logic;
  SIGNAL s_clk_div5   : std_logic;
  SIGNAL s_clk_div6   : std_logic;
  SIGNAL s_clk_div7   : std_logic;
  SIGNAL s_clk_div8   : std_logic;

  SIGNAL s_ce         : std_logic;
  SIGNAL s_clr        : std_logic;

BEGIN

  ---------------------------------------------------------------------------
  -- Control Signal Generation
  ---------------------------------------------------------------------------
  s_ce  <= '1';              -- Clock enable always active
  s_clr <= NOT i_rst_n;      -- Active high clear from active low reset

  ---------------------------------------------------------------------------
  -- BUFR Instances - Demonstrating All Division Capabilities
  ---------------------------------------------------------------------------

  -- BUFR with BYPASS (no division, 100 MHz output)
  bufr_bypass_inst : BUFR
    GENERIC MAP (
      BUFR_DIVIDE => "BYPASS",
      SIM_DEVICE  => "7SERIES"
    )
    PORT MAP (
      O   => s_clk_bypass,
      CE  => s_ce,
      CLR => '0',
      I   => i_clk_100mhz
    );

  -- BUFR with divide by 1 (100 MHz output)
  bufr_div1_inst : BUFR
    GENERIC MAP (
      BUFR_DIVIDE => "1",
      SIM_DEVICE  => "7SERIES"
    )
    PORT MAP (
      O   => s_clk_div1,
      CE  => s_ce,
      CLR => s_clr,
      I   => i_clk_100mhz
    );

  -- BUFR with divide by 2 (50 MHz output)
  bufr_div2_inst : BUFR
    GENERIC MAP (
      BUFR_DIVIDE => "2",
      SIM_DEVICE  => "7SERIES"
    )
    PORT MAP (
      O   => s_clk_div2,
      CE  => s_ce,
      CLR => s_clr,
      I   => i_clk_100mhz
    );

  -- BUFR with divide by 3 (33.33 MHz output)
  bufr_div3_inst : BUFR
    GENERIC MAP (
      BUFR_DIVIDE => "3",
      SIM_DEVICE  => "7SERIES"
    )
    PORT MAP (
      O   => s_clk_div3,
      CE  => s_ce,
      CLR => s_clr,
      I   => i_clk_100mhz
    );

  -- BUFR with divide by 4 (25 MHz output)
  bufr_div4_inst : BUFR
    GENERIC MAP (
      BUFR_DIVIDE => "4",
      SIM_DEVICE  => "7SERIES"
    )
    PORT MAP (
      O   => s_clk_div4,
      CE  => s_ce,
      CLR => s_clr,
      I   => i_clk_100mhz
    );

  -- BUFR with divide by 5 (20 MHz output)
  bufr_div5_inst : BUFR
    GENERIC MAP (
      BUFR_DIVIDE => "5",
      SIM_DEVICE  => "7SERIES"
    )
    PORT MAP (
      O   => s_clk_div5,
      CE  => s_ce,
      CLR => s_clr,
      I   => i_clk_100mhz
    );

  -- BUFR with divide by 6 (16.67 MHz output)
  bufr_div6_inst : BUFR
    GENERIC MAP (
      BUFR_DIVIDE => "6",
      SIM_DEVICE  => "7SERIES"
    )
    PORT MAP (
      O   => s_clk_div6,
      CE  => s_ce,
      CLR => s_clr,
      I   => i_clk_100mhz
    );

  -- BUFR with divide by 7 (14.29 MHz output)
  bufr_div7_inst : BUFR
    GENERIC MAP (
      BUFR_DIVIDE => "7",
      SIM_DEVICE  => "7SERIES"
    )
    PORT MAP (
      O   => s_clk_div7,
      CE  => s_ce,
      CLR => s_clr,
      I   => i_clk_100mhz
    );

  -- BUFR with divide by 8 (12.5 MHz output)
  bufr_div8_inst : BUFR
    GENERIC MAP (
      BUFR_DIVIDE => "8",
      SIM_DEVICE  => "7SERIES"
    )
    PORT MAP (
      O   => s_clk_div8,
      CE  => s_ce,
      CLR => s_clr,
      I   => i_clk_100mhz
    );

  ---------------------------------------------------------------------------
  -- Output Assignments
  ---------------------------------------------------------------------------
  o_clk_bypass <= s_clk_bypass;
  o_clk_div1   <= s_clk_div1;
  o_clk_div2   <= s_clk_div2;
  o_clk_div3   <= s_clk_div3;
  o_clk_div4   <= s_clk_div4;
  o_clk_div5   <= s_clk_div5;
  o_clk_div6   <= s_clk_div6;
  o_clk_div7   <= s_clk_div7;
  o_clk_div8   <= s_clk_div8;

END ARCHITECTURE rtl;
