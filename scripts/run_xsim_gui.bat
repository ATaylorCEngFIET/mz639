@echo off
REM ------------------------------------------------------------------------------
REM File        : run_xsim_gui.bat
REM Description : Launch xsim with GUI and waveform viewer
REM Author      : Auto-generated
REM Date        : 2026-03-01
REM ------------------------------------------------------------------------------

set SCRIPT_DIR=%~dp0
set PROJECT_DIR=%SCRIPT_DIR%..

echo ==========================================
echo BUFR Demo - xsim GUI Simulation
echo ==========================================

cd /d "%PROJECT_DIR%\sim"

REM Check if snapshot exists, if not compile first
if not exist "xsim.dir\bufr_demo_tb_sim" (
    echo.
    echo [1/3] Analyzing VHDL sources...
    xvhdl --work work "%PROJECT_DIR%\src\bufr_demo_entity.vhd"
    if errorlevel 1 goto error
    
    xvhdl --work work "%PROJECT_DIR%\test\bufr_demo_tb_entity.vhd"
    if errorlevel 1 goto error
    
    echo.
    echo [2/3] Elaborating design...
    xelab --debug typical --mt auto -L unisims_ver work.bufr_demo_tb -s bufr_demo_tb_sim
    if errorlevel 1 goto error
)

echo.
echo [3/3] Launching xsim GUI with waveforms...
xsim bufr_demo_tb_sim -gui -tclbatch "%PROJECT_DIR%\scripts\view_waveform.tcl"

goto end

:error
echo ERROR: Simulation failed!
exit /b 1

:end
cd /d "%SCRIPT_DIR%"
