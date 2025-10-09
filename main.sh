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
    show_shortcut
    show_separator
    i=1
    while true; do
        menu_var_name="MENU_${i}"
        eval "menu_item_full=\"\${$menu_var_name}\""

        if [ -n "$menu_item_full" ]; then
            menu_text="${menu_item_full%%|*}"
            echo "$i) $menu_text"
            i=$((i + 1))
        else
            break
        fi
    done
    max_items=$((i - 1))

    show_separator
    printf "Select option: "
    read choice

    if [ "$choice" -ge 1 ] && [ "$choice" -le "$max_items" ] 2>/dev/null; then
        menu_var_name="MENU_${choice}"
        eval "menu_item_full=\"\${$menu_var_name}\""
        action_to_run="${menu_item_full#*|}"

        if [ "$action_to_run" != "$menu_item_full" ]; then
            success "Executing: $action_to_run"
            
            eval "$action_to_run"
            sleep 1
        else
            error "No action defined for this menu item! (Missing '|')"
            sleep 1
        fi
    else
        error "Invalid choice!"
        sleep 1
    fi
done
