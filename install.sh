#!/usr/bin/env bash

# Create symlinks with stow
$(stow i3 youtube-dl vim bash tmux)

# Install plugins
$(vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa")

# Install plugins
$(ln -rs cold.vim ~/.vim/plugged/lightline.vim/autoload/lightline/colorscheme/)

