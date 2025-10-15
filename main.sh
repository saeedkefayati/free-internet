#!/bin/sh
# ========================================
# Free Internet Main Installer
# Compatible with ash (BusyBox)
# ========================================


# -------------------------------
# Load all scripts
# -------------------------------
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

. "${SCRIPT_DIR}/config.cfg"

. "${SCRIPT_DIR}/utils/common.sh"
. "${SCRIPT_DIR}/utils/tool.sh"


# -------------------------------
# Main Menu
# -------------------------------
while true
do
    clear_terminal
    show_banner
    show_centered_text "Now you can use '${FREE_INTERNET_COMMAND}' command"
    show_separator
    
    menu_items=$(grep '^MENU_' "${SCRIPT_DIR}/config.cfg" | grep -v '^MENU_0')
    exit_item=$(grep '^MENU_0' "${SCRIPT_DIR}/config.cfg")

    all_items=$(printf "%s\n%s" "$menu_items" "$exit_item")

    echo "$all_items" | while IFS= read -r line; do
        if [ -n "$line" ]; then
            # Extract the number
            num=$(echo "$line" | cut -d'=' -f1 | cut -d'_' -f2)
            # Extract the menu text
            text=$(echo "$line" | cut -d'=' -f2 | tr -d '"' | cut -d'|' -f1)
            echo "${num}) $text"
        fi
    done


    show_separator
    printf "Select option: "
    read choice

    eval selected=\$MENU_${choice}
    if [ -n "$selected" ]; then
        action_to_run=$(echo "$selected" | cut -d'|' -f2)
        
        eval "$action_to_run"
        sleep 1
    else
        error "Invalid choice!"
        sleep 1
    fi
done
