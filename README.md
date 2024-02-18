# My Dev configuration

## Used tools

* tmux
  * xsel for tmux-yank
* [gogh](https://github.com/Gogh-Co/Gogh)
  * seti
* [starship](https://github.com/starship/starship)
* [vimrc](https://github.com/amix/vimrc)
* [ble.sh](https://github.com/akinomyoga/ble.sh)


## To consider

* tldr - https://github.com/tldr-pages/tldr


## Installation

``` bash
./install.sh
```

To make sure that tmux loads bashrc add to ~/.bash_profile

``` sh
if [ -n "$BASH_VERSION" -a -n "$PS1" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi
```

Source: https://unix.stackexchange.com/questions/320465/new-tmux-sessions-do-not-source-bashrc-file
