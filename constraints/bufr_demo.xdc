##------------------------------------------------------------------------------
## File        : bufr_demo.xdc
## Description : Constraints for BUFR Demo on Arty S7-50
## Target      : Digilent Arty S7-50 (xc7s50csga324-1)
## Author      : Auto-generated
## Date        : 2026-03-01
##------------------------------------------------------------------------------

##------------------------------------------------------------------------------
## Clock Input (100 MHz oscillator)
##------------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports i_clk_100mhz]
create_clock -period 10.000 -name sys_clk [get_ports i_clk_100mhz]

##------------------------------------------------------------------------------
## Reset (Active Low - Active when button NOT pressed)
## Using BTN0
##------------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN D9 IOSTANDARD LVCMOS33} [get_ports i_rst_n]

##------------------------------------------------------------------------------
## PMOD JA - Divided Clock Outputs (directly observable on oscilloscope)
## Note: These are clock outputs, ensure proper signal integrity for high freq
##------------------------------------------------------------------------------
## JA[0] - BYPASS (100 MHz)
set_property -dict {PACKAGE_PIN L17 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports o_clk_bypass]

## JA[1] - DIV1 (100 MHz)
set_property -dict {PACKAGE_PIN L18 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports o_clk_div1]

## JA[2] - DIV2 (50 MHz)
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports o_clk_div2]

## JA[3] - DIV3 (33.33 MHz)
set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports o_clk_div3]

## JA[4] - DIV4 (25 MHz)
set_property -dict {PACKAGE_PIN M16 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports o_clk_div4]

## JA[5] - DIV5 (20 MHz)
set_property -dict {PACKAGE_PIN M17 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports o_clk_div5]

## JA[6] - DIV6 (16.67 MHz)
set_property -dict {PACKAGE_PIN M18 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports o_clk_div6]

## JA[7] - DIV7 (14.29 MHz)
set_property -dict {PACKAGE_PIN N18 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports o_clk_div7]

##------------------------------------------------------------------------------
## PMOD JB - Additional Divided Clock Outputs
##------------------------------------------------------------------------------
## JB[0] - DIV8 (12.5 MHz)
set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports o_clk_div8]

##------------------------------------------------------------------------------
## Clock Output Constraints
## Define output clocks for proper timing analysis
##------------------------------------------------------------------------------
create_generated_clock -name clk_bypass -source [get_ports i_clk_100mhz] -divide_by 1 [get_ports o_clk_bypass]
create_generated_clock -name clk_div1   -source [get_ports i_clk_100mhz] -divide_by 1 [get_ports o_clk_div1]
create_generated_clock -name clk_div2   -source [get_ports i_clk_100mhz] -divide_by 2 [get_ports o_clk_div2]
create_generated_clock -name clk_div3   -source [get_ports i_clk_100mhz] -divide_by 3 [get_ports o_clk_div3]
create_generated_clock -name clk_div4   -source [get_ports i_clk_100mhz] -divide_by 4 [get_ports o_clk_div4]
create_generated_clock -name clk_div5   -source [get_ports i_clk_100mhz] -divide_by 5 [get_ports o_clk_div5]
create_generated_clock -name clk_div6   -source [get_ports i_clk_100mhz] -divide_by 6 [get_ports o_clk_div6]
create_generated_clock -name clk_div7   -source [get_ports i_clk_100mhz] -divide_by 7 [get_ports o_clk_div7]
create_generated_clock -name clk_div8   -source [get_ports i_clk_100mhz] -divide_by 8 [get_ports o_clk_div8]

##------------------------------------------------------------------------------
## Configuration
##------------------------------------------------------------------------------
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
