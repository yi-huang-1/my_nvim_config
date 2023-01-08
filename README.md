# Installation Guide

## Install Packer

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Dependencies

- nodejs
- npm
- python

## Pydocstring

`vim-pydocstring` requires `doq`.

The path of `doq` can be obtained by:

```bash
which doq
```

For example, to set the path of `doq` in `./lua/plugin-config/coc.lua`:

```lua
g.pydocstring_doq_path = '/Users/yihuang/opt/anaconda3/bin/doq'
```

