local config = function()
	require("lspsaga").setup({ })
end

-- Note: Run `TSInstall markdown markdown_inline` to show feedback correctly

return {
	"nvimdev/lspsaga.nvim",
	config = config,
  lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter", --optional
		"nvim-tree/nvim-web-devicons", --optional
	},
}
