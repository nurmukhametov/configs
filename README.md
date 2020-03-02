# README #

This repository contains settings for different tools.

- vim
- kitty (the terminal emulator supporting ligatures)
- starship (prompt)

## What is this repository for? ###

Host any useful tool configs for the easy installation on new machine.

## How do I get set up? ###

### vim

Create symlink and download plug.vim.

```bash
# Suppose you clone repo to ~/configs
cd ~
ln -s ~/configs/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Run inside vim 

```bash
:PlugInstall
```

### kitty

Create symlink

```bash
cd ~/.config/kitty
ln -s  ~/configs/kitty.conf
```

### starship

Create symlink

```bash
cd ~/.config
ln -s ~/configs/starship.toml
```
