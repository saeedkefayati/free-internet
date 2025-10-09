#!/bin/sh
#========================================
# Tool Helper Functions
#========================================


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

    success "Cloning $name into $dir successfully!"

    if [ -f "$dir/install.sh" ]; then
        sh "$dir/install.sh"
    else
        warn "No install.sh found for $name, skipping execution."
    fi
}