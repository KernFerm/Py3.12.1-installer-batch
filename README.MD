# Python 3.12.1 Installation Script

This repository contains a robust batch script designed to install Python 3.12.1 on Windows. The script includes detailed logging functionality, ensuring that each step of the installation process is recorded in a log file created on your desktop.

## Features

- **Automated Installation:** The script automatically downloads and installs Python 3.12.1.
- **Detailed Logging:** All steps of the installation process are logged into a file located in a `Python_Install_Logs` folder on your desktop.
- **Error Handling:** The script checks for errors during the download, installation, and verification processes, logging any issues encountered.
- **Silent Installation:** Python is installed silently with all users having access, and the PATH variable is updated automatically.

## Usage

1. **Download the Script:**

   - Click on the `install_python_3.12.1.bat` file in this repository.
   - Click the "Download" button to save the script to your local machine.

2. **Run the Script:**

   - Navigate to the location where you downloaded the script.
   - Right-click on `install_python_3.12.1.bat` and select `Run as administrator`.

## Script Breakdown

### Variables

- **PYTHON_VERSION:** Specifies the Python version to install (3.12.1).
- **LOG_DIR:** Directory where the log file will be stored (on your desktop).
- **LOG_FILE:** The log file that records the installation process.
- **INSTALLER_NAME:** The name of the Python installer file.
- **INSTALLER_URL:** The URL from which the Python installer is downloaded.

### Steps

1. **Create Log Directory:** The script first checks if the log directory exists on the desktop. If not, it creates the directory.
2. **Start Logging:** The script begins logging each step.
3. **Download Installer:** The script downloads the Python installer from the official Python website.
4. **Install Python:** The installer is run silently, installing Python for all users and updating the PATH.
5. **Verify Installation:** After installation, the script checks that Python was installed correctly by running `python --version`.
6. **Cleanup:** The installer file is deleted after a successful installation.

## Logging

All log files are stored in the `Python_Install_Logs` folder on your desktop. Each log entry includes a timestamp for easy tracking. The log file provides a detailed report on each step of the installation process, including any errors encountered.

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/KernFerm/Py3.12.1-installer-batch/blob/main/LICENSE) file for details.

## Contributing

If you have suggestions or improvements, please feel free to share by contacting me directly.

## Contact

For any questions or issues, please [create a issue](https://github.com/KernFerm/Py3.12.1-installer-batch/issues).
----------------
----------------
