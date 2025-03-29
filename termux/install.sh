apt update -y && apt upgrade -y
pkg install git -y
pkg install python -y
pkg install openssh -y
pkg install lazygit -y
pkg install nodejs -y
pkg install which -y
pkg install neovim -y
mkdir projetos
git clone https://github.com/MillasNasser/dotfiles.git
mv dotfiles/ projetos/dotfiles
ln -s ~/projetos/dotfiles/nvim ~/.config/nvim
curl -o /data/data/com.termux/files/usr/bin/install-in-mason  https://raw.githubusercontent.com/Amirulmuuminin/setup-mason-for-termux/main/install-in-mason
chmod +x /data/data/com.termux/files/usr/bin/install-in-mason
install-in-mason lua-language-server
git config --global user.name "Millas Nasser"
git config --global user.email "millas5444@gmail.com"
ssh-keygen -t ed25519 -C "millas5444@gmail.com"
sh -c "$(curl -sSL https://raw.githubusercontent.com/blackc8/termux-composer/master/install)"
composer self-update --2
