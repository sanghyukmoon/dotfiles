# dotfiles

This repository contains configuration files managed by [YADM](https://yadm.io) dotfile manager.
To version control Vim plugins managed by built-in packages feature, they are added as [Git Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules), where `$HOME` serves as a superproject.
New plugin should be installed by, e.g.,
```bash
> yadm submodule add git@github.com:github/copilot.vim.git .vim/pack/smoon/start/copilot.vim
```
In Vim packages system, user has a responsibility for generating helptags. Easiest way is to run `:helpt ALL`, which will generate helptags for all `doc` directories in `runtimepath` (`$HOME/.vim` in Unix).
