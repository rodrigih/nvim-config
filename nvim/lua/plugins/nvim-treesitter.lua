local config = function()
	require("nvim-treesitter").setup({
		auto_install = true,
		ensure_installed = {
			"c",
			"c_sharp",
			"cpp",
			"css",
			"diff",
			"dockerfile",
			"eex",
			"elixir",
			"gitcommit",
			"gitignore",
			"heex",
			"javascript",
			"jsdoc",
			"json",
			"lua",
			"python",
			"rust",
			"sql",
			"typescript",
		},
    highlight = {
      enable = true,
    }
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = config,
}
