#! /bin/bash

# Searching for the script basepath
# source: https://stackoverflow.com/a/246128
# git_path=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
    SOURCE=$(readlink "$SOURCE")
    [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
git_path=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )

echo $git_path

# Checking if there is a new update, if it's exist, download it to the machine
# ToDo: Ask for permition to update?
git -C $git_path fetch
if test $(git -C $git_path diff main origin/main | wc -l) != 0
then
    echo "[INFO] Updating dotfiles"
    git -C $git_path pull
fi
