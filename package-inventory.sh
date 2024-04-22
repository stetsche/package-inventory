#!/bin/sh

DIR=$(dirname "$0")

# base config
## folder where package inventory files will get stored
PACKAGE_INVENTORY_FOLDER="$HOME"

## configuration file to override this variables
PACKAGE_INVENTORY_CONFIG_PATH="$HOME/.config/package-inventory/config.sh"

## command that retrieves the system packages
PACKAGE_INVENTORY_LIST_COMMAND="apt list --installed"

# source config if it exists
if [ -f "$PACKAGE_INVENTORY_CONFIG_PATH" ]; then
    source "$PACKAGE_INVENTORY_CONFIG_PATH"
fi

error() {
    echo "error: $1"
}

# error out package inventory folder does not exist
if [ ! -d "$PACKAGE_INVENTORY_FOLDER" ]; then
    error "$PACKAGE_INVENTORY_FOLDER does not exist or is not a folder"
    exit 1
fi

PACKAGE_LIST=$($PACKAGE_INVENTORY_LIST_COMMAND)

# count packages by line count
PACKAGE_COUNT=$(echo "$PACKAGE_LIST" | wc -l)

# YYYYMMDD timestamp for filename
PACKAGE_INVENTORY_DATE=$(date +"%Y%m%d")

# transform hostname to uppercase for filename
SYSTEM_NAME=$(hostname | tr '[:lower:]' '[:upper:]')

PACKAGE_INVENTORY_FILENAME="$PACKAGE_INVENTORY_DATE-PACKAGES-$SYSTEM_NAME.txt"

PACKAGE_INVENTORY_PATH="$PACKAGE_INVENTORY_FOLDER/$PACKAGE_INVENTORY_FILENAME"

echo "$PACKAGE_LIST" > "$PACKAGE_INVENTORY_PATH" 2>/dev/null

echo "Saved inventory of $PACKAGE_COUNT packages to $PACKAGE_INVENTORY_PATH"
