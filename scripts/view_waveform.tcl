#------------------------------------------------------------------------------
# File        : view_waveform.tcl
# Description : xsim TCL script to setup waveform display for BUFR demo
# Author      : Auto-generated
# Date        : 2026-03-01
#------------------------------------------------------------------------------

# Add divider for clock inputs
add_wave_divider "Clock & Reset"
add_wave /bufr_demo_tb/s_clk_100mhz -color yellow
add_wave /bufr_demo_tb/s_rst_n -color red

# Add divider for BUFR outputs
add_wave_divider "BUFR Divided Clocks"
add_wave /bufr_demo_tb/s_clk_bypass -name "BYPASS (100 MHz)" -color cyan
add_wave /bufr_demo_tb/s_clk_div1 -name "DIV1 (100 MHz)" -color green
add_wave /bufr_demo_tb/s_clk_div2 -name "DIV2 (50 MHz)" -color green
add_wave /bufr_demo_tb/s_clk_div3 -name "DIV3 (33.3 MHz)" -color green
add_wave /bufr_demo_tb/s_clk_div4 -name "DIV4 (25 MHz)" -color green
add_wave /bufr_demo_tb/s_clk_div5 -name "DIV5 (20 MHz)" -color green
add_wave /bufr_demo_tb/s_clk_div6 -name "DIV6 (16.7 MHz)" -color green
add_wave /bufr_demo_tb/s_clk_div7 -name "DIV7 (14.3 MHz)" -color green
add_wave /bufr_demo_tb/s_clk_div8 -name "DIV8 (12.5 MHz)" -color green

# Add divider for edge counters
add_wave_divider "Edge Counters (Verification)"
add_wave /bufr_demo_tb/s_cnt_bypass -name "Count BYPASS" -color orange -radix unsigned
add_wave /bufr_demo_tb/s_cnt_div2 -name "Count DIV2" -color orange -radix unsigned
add_wave /bufr_demo_tb/s_cnt_div4 -name "Count DIV4" -color orange -radix unsigned
add_wave /bufr_demo_tb/s_cnt_div8 -name "Count DIV8" -color orange -radix unsigned

# Add internal DUT signals
add_wave_divider "DUT Internals"
add_wave /bufr_demo_tb/dut_inst/s_ce -name "Clock Enable" -color magenta
add_wave /bufr_demo_tb/dut_inst/s_clr -name "Clear" -color magenta

# Run simulation
run 2500ns

# Zoom to fit all
wave zoom full

puts "=========================================="
puts "Waveform loaded - BUFR Division Demo"
puts "Simulation time: 2.5 us"
puts "=========================================="
