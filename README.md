# Personal Neovim Configuration

This is my personal config files for Neovim

## Setup
Clone the repo into the `.config` folder or copy the command below:

```
git clone git@github.com:rodrigih/nvim-config.git ~/.config/
```

Also, ensure Neovim is installed: [download here](https://neovim.io/)
While not required, installing a Nerd Font is recommended to display icons used by the NvimTree file explorer plugin

## Overview
This configuration uses the [Lazy plugin](https://github.com/folke/lazy.nvim) manager.

While you can read the documentation on that repo, the steps of adding plugins is as follows:
1. Create a new lua file, preferably with the same name as the plugin
2. Return a lua table with the github repo name as the first argument
3. An `opts` table or a `config` function that returns a table (`opts` is preferred)
4. If it's a start plugin (`lazy=false`) set a `priority`. Usually done with colorschemes

After the steps above, next time you load Neovim, it should install the new plugins automatically. If not, use the `:Lazy` command to bring up the pluing manager and install it manually with `I`.

The `init.lua` file is what Neovim uses to load the configuration file. In turn, that file loads `lua/config/init.lua` which is the main Lazy config folder. Read the documentation for Lazy for more details on options.

## Plugins
Plugin folders are created under the `lua/plugins` directory. Here's a brief overview of the plugtins installed in this repo:

- Comment ([repo link](https://github.com/terrortylor/nvim-comment))
    - Adds shortcuts for toggling line and block comments
- LSP Saga ([repo link](https://github.com/nvimdev/lspsaga.nvim))
    - Adds LSP features, such as icons and hover comments
- Lualine ([repo link](https://github.com/nvim-lualine/lualine.nvim))
    - Neovim statusline shown at the bottom
- Mason ([repo link](https://github.com/williamboman/mason.nvim))
    - Neovim statusline shown at the bottom
- Mason LSP Config ([repo link](https://github.com/williamboma/mason-lspconfig.nvim))
    - Bridges the gap between Mason and LSP Config. Essentially, an extension of Mason
- LSP Config ([repo link](https://github.com/neovim/nvim-lspconfig))
    - Provides default LSP configurations for various LSP servers (more of a data-only repo)
- Nvim Tree ([repo link](https://github.com/nvim-tree/nvim-tree.lua))
    - File explorer for Neovim
- Nvim Treesitter ([repo link](https://github.com/nvim-treesitter/nvim-treesitter))
    - Improved syntax highlighting
- Nvim Web Dev Icons ([repo link](https://github.com/nvim-tree/nvim-web-devicons))
    - Nerd Font Icons for other plugins
- Telescope ([repo link](https://github.com/nvim-telescope/telescope.nvim))
    - Fuzzy finder with live grep for files, buffers, etc.
- Vim Fugitive ([repo link](https://github.com/tpope/vim-fugitive))
    - Git plugin for Vim, including diff/blames/merge etc.
- Which Key ([repo link](https://github.com/folke/which-key.nvim))
    - Plugin that shows a pop-up for available key-bindings as you type
