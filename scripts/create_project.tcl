#------------------------------------------------------------------------------
# File        : create_project.tcl
# Description : TCL script to create Vivado project for BUFR Demo
# Target      : Arty S7-50 (xc7s50csga324-1)
# Author      : Auto-generated
# Date        : 2026-03-01
#------------------------------------------------------------------------------

# Get the directory where this script is located
set script_dir [file dirname [info script]]
set project_dir [file normalize "$script_dir/.."]

# Project settings
set project_name "bufr_demo"
set part_number "xc7s50csga324-1"

# Create project
create_project $project_name "$project_dir/vivado" -part $part_number -force

# Set project properties
set_property target_language VHDL [current_project]
set_property simulator_language VHDL [current_project]

# Add source files
add_files -norecurse "$project_dir/src/bufr_demo_entity.vhd"
set_property library work [get_files "$project_dir/src/bufr_demo_entity.vhd"]

# Add constraints
add_files -fileset constrs_1 -norecurse "$project_dir/constraints/bufr_demo.xdc"

# Add simulation sources
add_files -fileset sim_1 -norecurse "$project_dir/test/bufr_demo_tb_entity.vhd"
set_property library work [get_files -of_objects [get_filesets sim_1]]

# Set top module for synthesis
set_property top bufr_demo [current_fileset]

# Set top module for simulation
set_property top bufr_demo_tb [get_filesets sim_1]
set_property top_lib work [get_filesets sim_1]

# Configure simulation settings
set_property -name {xsim.simulate.runtime} -value {3us} -objects [get_filesets sim_1]

# Update compile order
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

puts "=========================================="
puts "Project created successfully!"
puts "Project: $project_name"
puts "Part:    $part_number"
puts "Location: $project_dir/vivado"
puts "=========================================="

# Close project (optional - comment out if you want to keep it open)
# close_project
