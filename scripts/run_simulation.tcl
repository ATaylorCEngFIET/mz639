#------------------------------------------------------------------------------
# File        : run_simulation.tcl
# Description : TCL script to run xsim simulation for BUFR Demo
# Author      : Auto-generated
# Date        : 2026-03-01
#------------------------------------------------------------------------------

# Get the directory where this script is located
set script_dir [file dirname [info script]]
set project_dir [file normalize "$script_dir/.."]

# Open existing project or create if needed
if {[file exists "$project_dir/vivado/bufr_demo.xpr"]} {
    open_project "$project_dir/vivado/bufr_demo.xpr"
} else {
    puts "ERROR: Project not found. Run create_project.tcl first."
    exit 1
}

# Launch simulation
launch_simulation

# Run simulation for 3 microseconds
run 3us

# Report completion
puts "=========================================="
puts "Simulation complete!"
puts "=========================================="
