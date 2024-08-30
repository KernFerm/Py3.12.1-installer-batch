@echo off
setlocal EnableDelayedExpansion

:: Define variables
set PYTHON_VERSION=3.12.1
set LOG_DIR=%USERPROFILE%\Desktop\Python_Install_Logs
set LOG_FILE=!LOG_DIR!\python_install_!PYTHON_VERSION!.log
set INSTALLER_NAME=python-!PYTHON_VERSION!-amd64.exe
set INSTALLER_URL=https://www.python.org/ftp/python/!PYTHON_VERSION!/!INSTALLER_NAME!

:: Create log directory
if not exist "!LOG_DIR!" (
    mkdir "!LOG_DIR!"
    if errorlevel 1 (
        echo Failed to create log directory. Check permissions.
        goto end
    )
)

:: Start logging
echo %DATE% %TIME%: Starting installation of Python !PYTHON_VERSION%! >> "!LOG_FILE!"

:: Download Python installer
echo Downloading Python !PYTHON_VERSION%! installer
powershell -Command "Invoke-WebRequest -Uri '!INSTALLER_URL!' -OutFile '!INSTALLER_NAME!'" >> "!LOG_FILE!" 2>&1
if errorlevel 1 (
    echo Failed to download Python installer. Check log file for details.
    echo %DATE% %TIME%: Failed to download Python installer >> "!LOG_FILE!"
    goto end
)

echo Successfully downloaded Python installer
echo %DATE% %TIME%: Successfully downloaded Python installer >> "!LOG_FILE!"

:: Install Python silently
echo Installing Python !PYTHON_VERSION!...
!INSTALLER_NAME! /quiet InstallAllUsers=1 PrependPath=1 Include_test=0 >> "!LOG_FILE!" 2>&1
if errorlevel 1 (
    echo Python installation failed. Check log file for details.
    echo %DATE% %TIME%: Python installation failed >> "!LOG_FILE!"
    goto end
)

echo Python !PYTHON_VERSION! installed successfully
echo %DATE% %TIME%: Python !PYTHON_VERSION! installed successfully >> "!LOG_FILE!"

:: Verify installation
echo Verifying Python installation...
python --version >> "!LOG_FILE!" 2>&1
if errorlevel 1 (
    echo Python verification failed. Check log file for details.
    echo %DATE% %TIME%: Python verification failed >> "!LOG_FILE!"
    goto end
)

echo Python installation verified
echo %DATE% %TIME%: Python installation verified >> "!LOG_FILE!"

echo Installation completed successfully. Review the log file for details.
echo %DATE% %TIME%: Installation completed successfully >> "!LOG_FILE!"

:end
echo Press any key to exit...
pause >nul
endlocal
