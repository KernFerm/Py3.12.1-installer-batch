@echo off
setlocal EnableDelayedExpansion

:: Define variables
set PYTHON_VERSION=3.12.1
set PYTHON_INSTALLER_PATH=%USERPROFILE%\Downloads
set INSTALLER_NAME=python-!PYTHON_VERSION!-amd64.exe
set INSTALLER_URL=https://www.python.org/ftp/python/!PYTHON_VERSION!/!INSTALLER_NAME!
set LOG_DIR=%USERPROFILE%\Desktop\Python_Install_Logs
set LOG_FILE=!LOG_DIR!\python_install_!PYTHON_VERSION!.log

:: Check and create log directory
if not exist "!LOG_DIR!" (
    echo Creating log directory...
    mkdir "!LOG_DIR!"
    if errorlevel 1 (
        echo Failed to create log directory at !LOG_DIR!. Check permissions.
        pause
        goto end
    )
)

:: Output to console and log file
echo %DATE% %TIME%: Starting download of Python !PYTHON_VERSION%! >> "!LOG_FILE!"
echo Starting download of Python !PYTHON_VERSION%!...

:: Download Python installer using PowerShell
powershell -Command "Invoke-WebRequest -Uri '!INSTALLER_URL!' -OutFile '!PYTHON_INSTALLER_PATH!\!INSTALLER_NAME!'" >> "!LOG_FILE!" 2>&1
if errorlevel 1 (
    echo Download failed, see log at !LOG_FILE! for details.
    pause
    goto end
)

echo %DATE% %TIME%: Starting installation of Python !PYTHON_VERSION%! >> "!LOG_FILE!"
echo Starting installation of Python !PYTHON_VERSION%!...

:: Install Python
"!PYTHON_INSTALLER_PATH!\!INSTALLER_NAME!" /passive InstallAllUsers=1 PrependPath=1 Include_test=0 >> "!LOG_FILE!" 2>&1
if errorlevel 1 (
    echo Installation failed, see log at !LOG_FILE! for details.
    pause
    goto end
)

echo Verifying Python installation...
py -3.12 -c "import sys; print('Python version:', sys.version)" >> "!LOG_FILE!" 2>&1
if errorlevel 1 (
    echo Verification failed. Python 3.12.1 might not have installed correctly.
    pause
    goto end
)

echo Cleaning up installation files...
del /f /q "!PYTHON_INSTALLER_PATH!\!INSTALLER_NAME!" >> "!LOG_FILE!" 2>&1

echo Installation and verification completed successfully.
echo %DATE% %TIME%: Python !PYTHON_VERSION! installation and verification completed successfully. >> "!LOG_FILE!"

echo Installation complete. Press any key to exit.
pause

:end
endlocal
