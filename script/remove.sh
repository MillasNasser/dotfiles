#! /bin/bash

# Functions
function remove() {
    # TODO: Add path into target.txt instead of search in $HOME
    target_path=$HOME/$target
    if ! test -f "$target_path"; then return 0; fi
    
    echo "[INFO] Removing from $target"

    # Removing installation from the system
    pattern="/dotfiles\/script\/update/d"
    sed $pattern $target_path > /tmp/$target
    sed "/export DOTFILES/d" /tmp/$target > $target_path
}

# Main structure
echo "--------------------------------------------"
echo "Removing last installation"
echo "--------------------------------------------"
if test -f "$DOTFILES/target.txt"
then
    while read target; do
        remove $target
    done < $DOTFILES/target.txt
    echo "[INFO] Done"
fi

