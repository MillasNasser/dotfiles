#! /bin/bash

SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
    SOURCE=$(readlink "$SOURCE")
    [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done

# Constants
DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )

# Functions
function remove() {
    # TODO: Add path into target.txt instead of search in $HOME
    target_path=$HOME/$target
    if ! test -f "$target_path"; then return 0; fi
    
    echo "[INFO] Removing from $target"

    # Removing installation from the system
    pattern="/^source.*dotfiles\/script\/update/d"
    sed $pattern $target_path > /tmp/$target
    mv /tmp/$target $target_path
}

# Main structure
echo "--------------------------------------------"
echo "Removing last installation"
echo "--------------------------------------------"
while read target; do remove $target; done < $DIR/target.txt

echo "[INFO] Done"
