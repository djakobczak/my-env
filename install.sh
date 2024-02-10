#!/bin/bash


# https://github.com/sharkdp/bat
echo "Installing bat"
sudo apt install bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

cat << EOF
Add to .bashrc
export PATH="\${PATH}:\${HOME}/.local/bin"
EOF


