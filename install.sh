#!/bin/sh

# ========================================
# Free Internet Main Installer
# Compatible with ash (BusyBox)
# ========================================

# Load configs and common helpers
. ./config.cfg
. ./utils/common.sh

# -------------------------------
# Pre-flight checks
# -------------------------------
check_command git
check_command sh

# -------------------------------
# Main Menu
# -------------------------------
while true
do
    clear_terminal
    show_banner
    echo "1) Install Passwall"
    echo "2) Future Tool"
    echo "0) Exit"
    echo "-----------------------------------------------------"
    printf "Select option: "
    read choice

    case "$choice" in
        1)
            prepare_tool "passwall1" "$PASSWALL_REPO"
            sh "$TOOLS_DIR/passwall1/install.sh"
            printf "\nPress Enter to continue..."
            read dummy
            ;;
        2)
            warn "This feature will be added soon."
            sleep 2
            ;;
        0)
            success "Exiting installer. Bye!"
            exit 0
            ;;
        *)
            error "Invalid choice!"
            sleep 1
            ;;
    esac
done
