-------------------------------------------------------------------------------
-- File        : bufr_demo_tb_entity.vhd
-- Description : Testbench for BUFR Division Demonstration
--               Verifies clock division ratios from BYPASS to /8
-- Target      : Simulation Only
-- Author      : Auto-generated
-- Date        : 2026-03-01
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

-------------------------------------------------------------------------------
-- Testbench Entity Declaration
-------------------------------------------------------------------------------
ENTITY bufr_demo_tb IS
END ENTITY bufr_demo_tb;

-------------------------------------------------------------------------------
-- Testbench Architecture
-------------------------------------------------------------------------------
ARCHITECTURE bench OF bufr_demo_tb IS

  ---------------------------------------------------------------------------
  -- Component Declaration
  ---------------------------------------------------------------------------
  COMPONENT bufr_demo IS
    GENERIC (
      g_sim_mode : boolean := false
    );
    PORT (
      i_clk_100mhz : IN  std_logic;
      i_rst_n      : IN  std_logic;
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
  END COMPONENT bufr_demo;

  ---------------------------------------------------------------------------
  -- Constants
  ---------------------------------------------------------------------------
  CONSTANT c_clk_period   : time := 10 ns;  -- 100 MHz clock
  CONSTANT c_sim_duration : time := 2 us;   -- Simulation duration

  ---------------------------------------------------------------------------
  -- Testbench Signals
  ---------------------------------------------------------------------------
  SIGNAL s_clk_100mhz : std_logic := '0';
  SIGNAL s_rst_n      : std_logic := '0';
  SIGNAL s_clk_bypass : std_logic;
  SIGNAL s_clk_div1   : std_logic;
  SIGNAL s_clk_div2   : std_logic;
  SIGNAL s_clk_div3   : std_logic;
  SIGNAL s_clk_div4   : std_logic;
  SIGNAL s_clk_div5   : std_logic;
  SIGNAL s_clk_div6   : std_logic;
  SIGNAL s_clk_div7   : std_logic;
  SIGNAL s_clk_div8   : std_logic;

  -- Edge counters for verification
  SIGNAL s_cnt_bypass : integer := 0;
  SIGNAL s_cnt_div1   : integer := 0;
  SIGNAL s_cnt_div2   : integer := 0;
  SIGNAL s_cnt_div3   : integer := 0;
  SIGNAL s_cnt_div4   : integer := 0;
  SIGNAL s_cnt_div5   : integer := 0;
  SIGNAL s_cnt_div6   : integer := 0;
  SIGNAL s_cnt_div7   : integer := 0;
  SIGNAL s_cnt_div8   : integer := 0;

  SIGNAL s_sim_done   : boolean := false;

BEGIN

  ---------------------------------------------------------------------------
  -- Clock Generation
  ---------------------------------------------------------------------------
  clk_gen_proc : PROCESS
  BEGIN
    WHILE NOT s_sim_done LOOP
      s_clk_100mhz <= '0';
      WAIT FOR c_clk_period / 2;
      s_clk_100mhz <= '1';
      WAIT FOR c_clk_period / 2;
    END LOOP;
    WAIT;
  END PROCESS clk_gen_proc;

  ---------------------------------------------------------------------------
  -- Reset Generation
  ---------------------------------------------------------------------------
  rst_gen_proc : PROCESS
  BEGIN
    s_rst_n <= '0';
    WAIT FOR 100 ns;
    s_rst_n <= '1';
    WAIT;
  END PROCESS rst_gen_proc;

  ---------------------------------------------------------------------------
  -- DUT Instantiation
  ---------------------------------------------------------------------------
  dut_inst : bufr_demo
    GENERIC MAP (
      g_sim_mode => true
    )
    PORT MAP (
      i_clk_100mhz => s_clk_100mhz,
      i_rst_n      => s_rst_n,
      o_clk_bypass => s_clk_bypass,
      o_clk_div1   => s_clk_div1,
      o_clk_div2   => s_clk_div2,
      o_clk_div3   => s_clk_div3,
      o_clk_div4   => s_clk_div4,
      o_clk_div5   => s_clk_div5,
      o_clk_div6   => s_clk_div6,
      o_clk_div7   => s_clk_div7,
      o_clk_div8   => s_clk_div8
    );

  ---------------------------------------------------------------------------
  -- Edge Counters for Verification (count rising edges after reset)
  ---------------------------------------------------------------------------
  cnt_bypass_proc : PROCESS(s_clk_bypass)
  BEGIN
    IF rising_edge(s_clk_bypass) AND s_rst_n = '1' THEN
      s_cnt_bypass <= s_cnt_bypass + 1;
    END IF;
  END PROCESS cnt_bypass_proc;

  cnt_div1_proc : PROCESS(s_clk_div1)
  BEGIN
    IF rising_edge(s_clk_div1) AND s_rst_n = '1' THEN
      s_cnt_div1 <= s_cnt_div1 + 1;
    END IF;
  END PROCESS cnt_div1_proc;

  cnt_div2_proc : PROCESS(s_clk_div2)
  BEGIN
    IF rising_edge(s_clk_div2) AND s_rst_n = '1' THEN
      s_cnt_div2 <= s_cnt_div2 + 1;
    END IF;
  END PROCESS cnt_div2_proc;

  cnt_div3_proc : PROCESS(s_clk_div3)
  BEGIN
    IF rising_edge(s_clk_div3) AND s_rst_n = '1' THEN
      s_cnt_div3 <= s_cnt_div3 + 1;
    END IF;
  END PROCESS cnt_div3_proc;

  cnt_div4_proc : PROCESS(s_clk_div4)
  BEGIN
    IF rising_edge(s_clk_div4) AND s_rst_n = '1' THEN
      s_cnt_div4 <= s_cnt_div4 + 1;
    END IF;
  END PROCESS cnt_div4_proc;

  cnt_div5_proc : PROCESS(s_clk_div5)
  BEGIN
    IF rising_edge(s_clk_div5) AND s_rst_n = '1' THEN
      s_cnt_div5 <= s_cnt_div5 + 1;
    END IF;
  END PROCESS cnt_div5_proc;

  cnt_div6_proc : PROCESS(s_clk_div6)
  BEGIN
    IF rising_edge(s_clk_div6) AND s_rst_n = '1' THEN
      s_cnt_div6 <= s_cnt_div6 + 1;
    END IF;
  END PROCESS cnt_div6_proc;

  cnt_div7_proc : PROCESS(s_clk_div7)
  BEGIN
    IF rising_edge(s_clk_div7) AND s_rst_n = '1' THEN
      s_cnt_div7 <= s_cnt_div7 + 1;
    END IF;
  END PROCESS cnt_div7_proc;

  cnt_div8_proc : PROCESS(s_clk_div8)
  BEGIN
    IF rising_edge(s_clk_div8) AND s_rst_n = '1' THEN
      s_cnt_div8 <= s_cnt_div8 + 1;
    END IF;
  END PROCESS cnt_div8_proc;

  ---------------------------------------------------------------------------
  -- Main Stimulus and Verification Process
  ---------------------------------------------------------------------------
  stim_proc : PROCESS
  BEGIN
    -- Wait for reset release and initial settling
    WAIT UNTIL s_rst_n = '1';
    WAIT FOR 50 ns;

    -- Report header
    REPORT "=========================================="
      SEVERITY note;
    REPORT "BUFR Division Demonstration Testbench"
      SEVERITY note;
    REPORT "Input Clock: 100 MHz (10 ns period)"
      SEVERITY note;
    REPORT "=========================================="
      SEVERITY note;

    -- Run simulation to observe clock division
    WAIT FOR c_sim_duration;

    -- Report results
    REPORT "=========================================="
      SEVERITY note;
    REPORT "Simulation Results (Rising Edge Counts):"
      SEVERITY note;
    REPORT "  BYPASS : " & integer'image(s_cnt_bypass) & " edges (expected ~" &
           integer'image(integer(c_sim_duration / c_clk_period)) & ")"
      SEVERITY note;
    REPORT "  DIV1   : " & integer'image(s_cnt_div1) & " edges (expected ~" &
           integer'image(integer(c_sim_duration / c_clk_period)) & ")"
      SEVERITY note;
    REPORT "  DIV2   : " & integer'image(s_cnt_div2) & " edges (expected ~" &
           integer'image(integer(c_sim_duration / (c_clk_period * 2))) & ")"
      SEVERITY note;
    REPORT "  DIV3   : " & integer'image(s_cnt_div3) & " edges (expected ~" &
           integer'image(integer(c_sim_duration / (c_clk_period * 3))) & ")"
      SEVERITY note;
    REPORT "  DIV4   : " & integer'image(s_cnt_div4) & " edges (expected ~" &
           integer'image(integer(c_sim_duration / (c_clk_period * 4))) & ")"
      SEVERITY note;
    REPORT "  DIV5   : " & integer'image(s_cnt_div5) & " edges (expected ~" &
           integer'image(integer(c_sim_duration / (c_clk_period * 5))) & ")"
      SEVERITY note;
    REPORT "  DIV6   : " & integer'image(s_cnt_div6) & " edges (expected ~" &
           integer'image(integer(c_sim_duration / (c_clk_period * 6))) & ")"
      SEVERITY note;
    REPORT "  DIV7   : " & integer'image(s_cnt_div7) & " edges (expected ~" &
           integer'image(integer(c_sim_duration / (c_clk_period * 7))) & ")"
      SEVERITY note;
    REPORT "  DIV8   : " & integer'image(s_cnt_div8) & " edges (expected ~" &
           integer'image(integer(c_sim_duration / (c_clk_period * 8))) & ")"
      SEVERITY note;
    REPORT "=========================================="
      SEVERITY note;

    -- End simulation
    REPORT "Simulation Complete"
      SEVERITY note;
    s_sim_done <= true;
    WAIT;
  END PROCESS stim_proc;

END ARCHITECTURE bench;

-------------------------------------------------------------------------------
-- Configuration
-------------------------------------------------------------------------------
CONFIGURATION bufr_demo_tb_bench_cfg OF bufr_demo_tb IS
  FOR bench
    FOR dut_inst : bufr_demo
      USE ENTITY work.bufr_demo(rtl);
    END FOR;
  END FOR;
END CONFIGURATION bufr_demo_tb_bench_cfg;
