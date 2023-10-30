#! /bin/bash

# Searching for the script basepath
# source: https://stackoverflow.com/a/246128
SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
    SOURCE=$(readlink "$SOURCE")
    [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done

# Constants
DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
QTD_INSTALL=0

# Functions
function install() {
    # TODO: Add path into target.txt instead of search in $HOME
    if ! test -f "$HOME/$target"; then return 0; fi
    
    QTD_INSTALL=$((QTD_INSTALL+1))
    echo "[INFO] Installing into $target"

    # Installing into file in target.txt
    echo "export DOTFILES=$DIR" >> $HOME/$target
    echo "(nohup $DIR/update.sh > /dev/null 2>&1 &)" >> $HOME/$target
}

# Main structure
echo "--------------------------------------------"
echo "Installing into the system"
echo "--------------------------------------------"
while read target; do install $target; done < $DIR/target.txt

if test $QTD_INSTALL == 0
then echo "[WARN] No file found"
else echo "[INFO] Done"
fi
