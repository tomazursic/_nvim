# Neovim configuration

## Dependences

System dependences in use

- fzf (is installed with plug.vim)
- ripgrep (use cargo)
- node.js (required by coc)
- bat (required by fzf preview)
- isort (sorting imports with coc-python)

## 1. Install Neovim

Install neovim Ubuntu (20.04)

    $ sudo apt-get install neovim

Older Ubuntu version < 20.04

    $ sudo apt-get install software-properties-common
    $ sudo apt-get install python-dev python-pip python3-dev python3-pip
    $ sudo apt-add-repository ppa:neovim-ppa/stable
    $ sudo apt-get update
    $ sudo apt-get install neovim

    # Required on older ubuntu versions to uspport :python
    $ sudo apt install python-neovim
    $ sudo apt install python3-neovim
    $ python3 -m pip install pynvim

Install latest version

Download `nvim.appimage` from https://github.com/neovim/neovim/releases

    chmod +x nvim.appimage && sudo mv nvim.appimage /usr/local/bin/nvim

Install neovim on OSX:

    $ brew update && brew install neovim

## 2. Install dependences:

    $ sudo apt-get install bat isort

    # Fix the install bat wihch change name in newer versions
    $ cd /usr/bin && sudo ln -s batcat bat

### Install ripgrep

https://github.com/rust-lang/rustup/blob/master/README.md#installation

1. Install rustup (rustc, cargo, rustup)

```shell
    $ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    # Chack versions
    $ cargo --version
    $ rustup --version
```

 2. Install rust

```shell
    $ rustup install stable
```

 3. Install ripgrep

```shell
    $ cargo install ripgrep
```


### Install NodeJS:

https://github.com/nodesource/distributions#debinstall

    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    sudo apt-get install -y nodejs

### Install python support dependences

Install code formating tools and linters:

    $ python3 -m pip install -U black flake8

## 3. Setup

    $ cd ~/.config && git clone git@github.com:tomazursic/_nvim.git nvim
    $ nvim +PlugInstall +qall

## Local configurations

Create file in `$HOME/.config/nvim/_local.vim` for configurations not included in git repository

## Plugins included

Check out `plugins.vim` file for more details

## Language server extensions for coc.nvim

### Python

https://github.com/neoclide/coc-python

    coc-python

### Rust

    coc-rls

https://github.com/neoclide/coc-rls

### Rust analyzer

    coc-rust-analyzer

https://github.com/fannheyward/coc-rust-analyzer

### Go 

    coc-go

https://github.com/josa42/coc-go


### Json 

    coc-json

### Yaml

    coc-yaml

### Emmet 

https://github.com/neoclide/coc-emmet

    coc-emmet
