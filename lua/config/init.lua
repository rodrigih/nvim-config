-- Lazy Plugin Manager
-- NOTE: location of plugins ~/.local/share/nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Installs Laxy if not already installed
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-- import Vims config files for options/globals/keymaps etc.
require("config.globals")
require("config.options")
require("config.keymaps")
require("config.autocmd")
require("config.user-commands")

-- Plugin Options
local opts = {
	defaults = {
		lazy = true,
	},
	install = {
		-- colorscheme = { "kanagawa" },
		colorscheme = { "rose-pine" }
	},
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
	},
	change_detection = {
		notify = false,
	},
}

require("lazy").setup("plugins", opts)
