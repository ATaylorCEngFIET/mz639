@echo off
REM ------------------------------------------------------------------------------
REM File        : run_xsim.bat
REM Description : Batch script to run xsim simulation standalone
REM Author      : Auto-generated
REM Date        : 2026-03-01
REM ------------------------------------------------------------------------------

set SCRIPT_DIR=%~dp0
set PROJECT_DIR=%SCRIPT_DIR%..

echo ==========================================
echo BUFR Demo - xsim Simulation
echo ==========================================

REM Create simulation directory
if not exist "%PROJECT_DIR%\sim" mkdir "%PROJECT_DIR%\sim"
cd /d "%PROJECT_DIR%\sim"

echo.
echo [1/3] Analyzing VHDL sources...
xvhdl --work work "%PROJECT_DIR%\src\bufr_demo_entity.vhd"
if errorlevel 1 goto error

xvhdl --work work "%PROJECT_DIR%\test\bufr_demo_tb_entity.vhd"
if errorlevel 1 goto error

echo.
echo [2/3] Elaborating design...
xelab --debug typical --mt auto -L unisims_ver -L unimacro_ver work.bufr_demo_tb -s bufr_demo_tb_sim
if errorlevel 1 goto error

echo.
echo [3/3] Running simulation...
xsim bufr_demo_tb_sim -runall -log simulation.log

echo.
echo ==========================================
echo Simulation complete!
echo Log file: %PROJECT_DIR%\sim\simulation.log
echo ==========================================
goto end

:error
echo.
echo ==========================================
echo ERROR: Simulation failed!
echo ==========================================
exit /b 1

:end
cd /d "%SCRIPT_DIR%"
