#!/bin/bash

# Define installation directory and source directory
INSTALL_DIR="/usr/local/xinit"
SRC_DIR="src"

# Color codes for styling
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Function to display usage instructions
usage() {
    echo -e "${BOLD}${YELLOW}Usage:${NC} $0 [${GREEN}install${NC}|${RED}uninstall${NC}|${BLUE}clean${NC}]"
    exit 1
}

# Function to handle installation
install() {
    echo -e "${BOLD}${GREEN}Installing xinit...${NC}"
    mkdir -p "$INSTALL_DIR/src"
    cp -r "$SRC_DIR/"* "$INSTALL_DIR/src/"
    echo -e "${BOLD}${GREEN}Installation completed successfully.${NC}"
}

# Function to handle uninstallation
uninstall() {
    echo -e "${BOLD}${RED}Uninstalling xinit...${NC}"
    rm -rf "$INSTALL_DIR"
    echo -e "${BOLD}${RED}Uninstallation completed successfully.${NC}"
}

# Function to clean installation files
clean() {
    echo -e "${BOLD}${BLUE}Cleaning up installation files...${NC}"
    rm -rf "$INSTALL_DIR/src/*"
    echo -e "${BOLD}${BLUE}Cleanup completed successfully.${NC}"
}

# Ensure exactly one argument is provided
if [ $# -ne 1 ]; then
    usage
fi

# Determine which operation to perform
case "$1" in
    install)
        install
        ;;
    uninstall)
        uninstall
        ;;
    clean)
        clean
        ;;
    *)
        usage
        ;;
esac