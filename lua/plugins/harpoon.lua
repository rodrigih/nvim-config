local keymap = vim.keymap

local set_keys = function()
	local harpoon = require("harpoon")

	local toggle_menu = function()
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end

	local clear_list = function()
		harpoon:list():clear()
	end

	local append = function()
		harpoon:list():append()
	end

	local remove = function(item)
		harpoon:list():remove(item)
	end

	return {
		keymap.set("n", "<leader>hl", toggle_menu),
		keymap.set("n", "<leader>ha", append),
		keymap.set("n", "<leader>hr", remove),
		keymap.set("n", "<leader>hc", clear_list),
	}
end

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2", -- This will eventually merge to master brancH
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("harpoon"):setup()
	end,
	-- keys = { keymap.set('n', '<leader>hl', toggle_menu), }
	keys = set_keys,
}
