# dotfiles

This repository contains configuration files managed by [YADM](https://yadm.io) dotfile manager.
To version control Vim plugins managed by built-in packages feature, they are added as [Git Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules), where `$HOME` serves as a superproject (see also https://yadm.io/docs/bootstrap#).
New plugin should be installed by, e.g.,
```bash
> yadm submodule add git@github.com:github/copilot.vim.git .vim/pack/smoon/start/copilot.vim
```
In Vim packages system, user has a responsibility for generating helptags. Easiest way is to run `:helpt ALL`, which will generate helptags for all `doc` directories in `runtimepath` (`$HOME/.vim` in Unix).


## New cluster setup
1. Install vim
   ```
   git clone https://github.com/vim/vim.git
   cd vim
   git pull
   cd src
   ```
   Open Makefile, search for `prefix`, and set it to $(HOME)/.local; Also, enable python3 support by searching --enable-python3interp and uncomment the line
   ```
   make
   make install
   ```
2. Install yadm
   ```
   curl -fLo $HOME/.local/bin/yadm https://github.com/yadm-dev/yadm/raw/master/yadm && chmod a+x $HOME/.local/bin/yadm
   yadm clone https://github.com/sanghyukmoon/dotfiles.git
   ```
3. Create ssh key and add public key to github
4. Install vim packages
   ```yadm submodule update --recursive --init```
