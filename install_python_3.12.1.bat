@echo off
setlocal

:: Define variables
set PYTHON_VERSION=3.12.1
set LOG_DIR=%USERPROFILE%\Desktop\Python_Install_Logs
set LOG_FILE=%LOG_DIR%\python_install_%PYTHON_VERSION%.log
set INSTALLER_NAME=python-%PYTHON_VERSION%-amd64.exe
set INSTALLER_URL=https://www.python.org/ftp/python/%PYTHON_VERSION%/%INSTALLER_NAME%

:: Create log directory
if not exist "%LOG_DIR%" (
    mkdir "%LOG_DIR%"
)

:: Log function
:log
echo %DATE% %TIME%: %* >> "%LOG_FILE%"
exit /b

:: Start logging
call :log "Starting installation of Python %PYTHON_VERSION%"

:: Download Python installer
call :log "Downloading Python %PYTHON_VERSION% installer"
powershell -Command "Invoke-WebRequest -Uri %INSTALLER_URL% -OutFile %INSTALLER_NAME%" >> "%LOG_FILE%" 2>&1
if errorlevel 1 (
    call :log "Failed to download Python installer"
    exit /b 1
)
call :log "Successfully downloaded Python installer"

:: Install Python silently
call :log "Installing Python %PYTHON_VERSION%"
%INSTALLER_NAME% /quiet InstallAllUsers=1 PrependPath=1 Include_test=0 >> "%LOG_FILE%" 2>&1
if errorlevel 1 (
    call :log "Python installation failed"
    exit /b 1
)
call :log "Python %PYTHON_VERSION% installed successfully"

:: Verify installation
call :log "Verifying Python installation"
python --version >> "%LOG_FILE%" 2>&1
if errorlevel 1 (
    call :log "Python verification failed"
    exit /b 1
)
call :log "Python installation verified"

:: Cleanup
call :log "Cleaning up"
del /f /q %INSTALLER_NAME% >> "%LOG_FILE%" 2>&1

call :log "Installation completed successfully"

:: Pause to allow the user to close the window
pause
endlocal

:: Pause again to keep the window open
pause
exit /b 0
