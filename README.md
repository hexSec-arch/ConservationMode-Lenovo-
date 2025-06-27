# Lenovo Battery Conservation Mode Controller

A utility to control the battery conservation mode on Lenovo laptops. This tool provides both a terminal-based interface and a Java-based GUI to easily manage your laptop's battery conservation mode.

## What is Battery Conservation Mode?

Battery Conservation Mode is a Lenovo feature that limits battery charging to 55-60% of its capacity to extend the battery's lifespan. This is particularly useful when your laptop is primarily used while plugged into AC power.

## Prerequisites

- A Lenovo laptop with conservation mode support
- Linux operating system
- Root privileges (sudo access)

## Available Versions

### 1. Terminal-Based Version (toggle_conservation.sh)

This version provides a text-based user interface (TUI) that works in any terminal.

#### Requirements
- `dialog` (<div><span style="color: #ff0000">I</span><span style="color: #ff0000">n</span><span style="color: #ff0100">s</span><span style="color: #ff0100">t</span><span style="color: #ff0200">a</span><span style="color: #ff0200">l</span><span style="color: #ff0200">l</span><span style="color: #ff0300"> </span><span style="color: #ff0300">t</span><span style="color: #ff0400">h</span><span style="color: #ff0400">i</span><span style="color: #ff0400">s</span><span style="color: #ff0500"> </span><span style="color: #ff0500">m</span><span style="color: #ff0600">a</span><span style="color: #ff0600">n</span><span style="color: #ff0600">u</span><span style="color: #ff0700">a</span><span style="color: #ff0700">l</span><span style="color: #ff0800">l</span><span style="color: #ff0800">y</span><span style="color: #ff0800"> </span><span style="color: #ff0900">o</span><span style="color: #ff0900">n</span><span style="color: #ff0a00"> </span><span style="color: #ff0a00">a</span><span style="color: #ff0a00">l</span><span style="color: #ff0b00">l</span><span style="color: #ff0b00"> </span><span style="color: #ff0c00">d</span><span style="color: #ff0c00">e</span><span style="color: #ff0c00">v</span><span style="color: #ff0d00">i</span><span style="color: #ff0d00">c</span><span style="color: #ff0e00">e</span><span style="color: #ff0e00">s</span><span style="color: #ff0f00"> </span><span style="color: #ff1100">e</span><span style="color: #ff1200">x</span><span style="color: #ff1300">c</span><span style="color: #ff1400">e</span><span style="color: #ff1600">p</span><span style="color: #ff1700">t</span><span style="color: #ff1800"> </span><span style="color: #ff1a00">t</span><span style="color: #ff1b00">h</span><span style="color: #ff1c00">o</span><span style="color: #ff1d00">s</span><span style="color: #ff1f00">e</span><span style="color: #ff2000"> </span><span style="color: #ff2100">r</span><span style="color: #ff2300">u</span><span style="color: #ff2400">n</span><span style="color: #ff2500">n</span><span style="color: #ff2600">i</span><span style="color: #ff2800">n</span><span style="color: #ff2900">g</span><span style="color: #ff2a00"> </span><span style="color: #ff2c00">U</span><span style="color: #ff2d00">b</span><span style="color: #ff2e00">u</span><span style="color: #ff2f00">n</span><span style="color: #ff3100">t</span><span style="color: #ff3200">u</span><span style="color: #ff3300">/</span><span style="color: #ff3500">D</span><span style="color: #ff3600">e</span><span style="color: #ff3700">b</span><span style="color: #ff3800">i</span><span style="color: #ff3a00">a</span><span style="color: #ff3b00">n</span></div>)

#### How to Use
1. Open terminal in the script directory
2. Make the script executable (if not already):
   ```bash
   chmod +x toggle_conservation.sh
   ```
3. Run the script with sudo:
   ```bash
   sudo ./toggle_conservation.sh
   ```
4. Navigate the menu:
   - Use ↑↓ arrow keys to select options
   - Press Enter to confirm selection
   - Press ESC or select Cancel to exit


## Features

- Real-time status display
- Easy toggle between enabled/disabled states
- Color-coded status indicators
- Error handling with informative messages
- Root privilege checking
- Automatic dependency installation (for terminal version)

## Troubleshooting

1. "Permission denied" error
   - Make sure to run the script with sudo
   - Check if the script is executable

2. "Conservation mode path not found" error
   - Verify that your laptop is a Lenovo model with conservation mode support
   - Check if the conservation mode file exists at:
     ```
     /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
     ```

3. Java version not running
   - Ensure Java is installed:
     ```bash
     java -version
     ```
   - Install Java if needed:
     ```bash
     sudo apt-get install default-jdk
     ```

## Safety Notes

- The script requires root privileges as it modifies system files
- Always ensure your laptop is plugged in when changing conservation mode settings
- Changes take effect immediately but may require a few minutes to be reflected in the battery status

## Contributing

Feel free to submit issues and enhancement requests!

## License

This project is open source and available under the MIT License.

## Disclaimer

This tool directly modifies system files. While it includes safety checks, use it at your own risk. Always ensure your important work is saved before modifying system settings.
