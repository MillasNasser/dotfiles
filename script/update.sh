#! /bin/bash

# Constants
git_path=$DOTFILES

# Checking if there is a new update, if it's exist, download it to the machine
# ToDo: Ask for permition to update?
git -C $git_path fetch
if test $(git -C $git_path diff main origin/main | wc -l) != 0
then
    echo "[INFO] Updating dotfiles"
    git -C $git_path pull
fi
