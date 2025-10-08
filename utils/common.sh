#!/bin/sh
#========================================
# Common Helper Functions
#========================================


# -------------------------------
# Colors
# -------------------------------
USE_COLOR=1
[ ! -t 1 ] && USE_COLOR=0

NC="\033[0m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
CYAN="\033[1;36m"

color() { [ "$USE_COLOR" -eq 1 ] && printf "%b" "$1" || true; }

#----------------------------------------
# Logger
#----------------------------------------
info()    { printf "%b\n" "${CYAN}[INFO]${NC} $1"; }
success() { printf "%b\n" "${GREEN}[OK]${NC} $1"; }
warn()    { printf "%b\n" "${YELLOW}[WARN]${NC} $1"; }
error()   { printf "%b\n" "${RED}[ERROR]${NC} $1"; }


#----------------------------------------
# Check if dependecy exists
#----------------------------------------
check_command() {
    cmd="$1"

    if command -v "$cmd" >/dev/null 2>&1; then
        info "Command '$cmd' found."
    else
        error "Required command '$cmd' not found. Please install it."
    fi
}


# -------------------------------
# Clear terminal
# -------------------------------
clear_terminal() {
    if command -v printf >/dev/null 2>&1; then
        printf "\033c"
    elif command -v clear >/dev/null 2>&1; then
        clear
    elif command -v reset >/dev/null 2>&1; then
        reset
    else
        error "No method to clear terminal available"
    fi
}


# -------------------------------
# Show Banner
# -------------------------------
show_banner() {
    cat ./banner.txt
    echo ""
    echo "         Now you can use '${FREE_INTERNET_COMMAND}' command      "
    echo "-----------------------------------------------------"
}


# -------------------------------
# Prepare a tool
# -------------------------------
check_and_prepare_tool() {
    name="$1"
    repo="$2"
    dir="$FREE_INTERNET_INSTALL_DIR/$name"

    [ -d "$FREE_INTERNET_INSTALL_DIR" ] || mkdir -p "$FREE_INTERNET_INSTALL_DIR"

    if [ ! -d "$dir" ]; then
        info "Cloning $name into $dir ..."
        git clone "$repo" "$dir" || { error "Failed to clone $name"; exit 1; }
    else
        info "$name already exists. Resetting and updating..."
        git -C "$dir" reset --hard || { error "Failed to reset $name"; exit 1; }
        git -C "$dir" clean -fd || { error "Failed to clean $name"; exit 1; }
        git -C "$dir" pull || { error "Failed to pull $name"; exit 1; }
    fi


    if [ -f "$dir/install.sh" ]; then
        sh "$dir/install.sh"
    else
        warn "No install.sh found for $name, skipping execution."
    fi

    success "Cloning $name into $dir successfully!"
}
