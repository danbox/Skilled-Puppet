#!/bin/bash

# Get the current username
username=$(whoami)

# .bashrc
ln -s /home/$username/config/bashrc /home/$username/.bashrc

# .ideavimrc
ln -s /home/$username/config/ideavimrc /home/$username/.ideavimrc

# .vimrc.local
ln -s /home/$username/config/vimrc.local /home/$username/.vimrc.local

# .zshrc
ln -s /home/$username/config/vshrc /home/$username/.vshrc
