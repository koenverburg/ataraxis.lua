# ataraxis.lua

> absence of mental stress or axiety, a state of serene calmness

## Installation

If you're using one of these plugin managers:

- [`paq-nvim`](https://github.com/savq/paq-nvim)
- [`packer.nvim`](https://github.com/wbthomason/packer.nvim)
- [`vim-plug`](https://github.com/junegunn/vim-plug)
- [`Vundle.vim`](https://github.com/VundleVim/Vundle.vim)
- [`dein.vim`](https://github.com/Shougo/dein.vim)
- [`minipac`](https://github.com/k-takata/minpac)

The installation method is pretty much the same for all of them, simply initialize the plugin manager and include `henriquehbr/nvim-startup.lua` on the list

Otherwise, if you're using [`pathogen`](https://github.com/tpope/vim-pathogen), simply clone it on your `~/.vim/bundle` directory:

```
$ git clone --depth 1 https://github.com/henriquehbr/nvim-startup.lua
```

> `nvim-startup` is intended to be immediately executed on (n)vim startup, so if your plugin manager has some sort of `opt` funcionality that marks it as a optional plugin, avoid it!

## Usage

To get it up and running, first, `require` it on your config:

lua:

```lua
require 'nvim-startup'.setup()
```

vimscript:

```vimscript
lua require 'nvim-startup'.setup()
```

## Configuration

The example below represents all the possible settings with their respective types and default values

```lua
require 'nvim-startup'.setup {
    width = 80 -- sets the writing area width
}
```
