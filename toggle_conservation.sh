#!/bin/bash

CONSERVATION_PATH="/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"

# Check if dialog is installed
if ! command -v dialog &> /dev/null; then
    echo "Dialog is not installed. Installing..."
    sudo apt-get update && sudo apt-get install -y dialog
fi

# Colors and styling
export DIALOGRC=/dev/null
export NEWT_COLORS='
window=,blue
border=white,blue
textbox=white,blue
button=black,white
'

# Function to check if running as root
check_root() {
    if [ "$EUID" -ne 0 ]; then
        dialog --title "Error" \
               --colors \
               --backtitle "Battery Conservation Mode Controller" \
               --msgbox "\Z1⚠️  Please run this script with sudo\Zn" 8 40
        exit 1
    fi
}

# Function to check if conservation path exists
check_path() {
    if [ ! -f "$CONSERVATION_PATH" ]; then
        dialog --title "Error" \
               --colors \
               --backtitle "Battery Conservation Mode Controller" \
               --msgbox "\Z1⚠️  Conservation mode path not found.\nIs this a Lenovo IdeaPad laptop?\Zn" 8 50
        exit 1
    fi
}

# Function to get current status
get_status() {
    local current_mode
    current_mode=$(cat "$CONSERVATION_PATH")
    if [ "$current_mode" -eq 1 ]; then
        echo "\Z2Enabled\Zn"
    else
        echo "\Z1Disabled\Zn"
    fi
}

# Function to set conservation mode
set_conservation_mode() {
    local mode=$1
    echo "$mode" > "$CONSERVATION_PATH"
    if [ $? -eq 0 ]; then
        dialog --title "Success" \
               --colors \
               --backtitle "Battery Conservation Mode Controller" \
               --msgbox "\Z2✓ Conservation mode has been ${mode:+enabled}${mode:=disabled}\Zn" 8 40
    else
        dialog --title "Error" \
               --colors \
               --backtitle "Battery Conservation Mode Controller" \
               --msgbox "\Z1⚠️  Failed to set conservation mode\Zn" 8 40
    fi
}

# Main menu function
show_menu() {
    while true; do
        current_status=$(get_status)
        choice=$(dialog --title "Battery Conservation Mode Controller" \
                       --colors \
                       --backtitle "Battery Conservation Mode Controller" \
                       --ok-label "Select" \
                       --cancel-label "Exit" \
                       --menu "\nCurrent Status: $current_status\n\nChoose an action:" \
                       15 50 2 \
                       1 "Enable Conservation Mode" \
                       2 "Disable Conservation Mode" \
                       2>&1 >/dev/tty)

        exit_status=$?
        clear

        if [ $exit_status -ne 0 ]; then
            exit
        fi

        case $choice in
            1)
                set_conservation_mode 1
                ;;
            2)
                set_conservation_mode 0
                ;;
        esac
    done
}

# Main program
clear
check_root
check_path
show_menu
