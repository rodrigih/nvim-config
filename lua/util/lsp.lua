local M = {}

-- enable keybinds for when lsp server available
M.on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "<leader>fd", "<cmd>Lspsaga finder<CR>", opts) -- go to definition
	vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- peak definition
	vim.keymap.set("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", opts) -- go to definition
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

	-- vim.keymap.set("n", "<leader>ca", "Lspsaga code_action", "n", opts) -- see available code actions
	-- vim.keymap.set("n", "<leader>rn", "Lspsaga rename", "n", opts) -- smart rename
	vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	-- vim.keymap.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to prev diagnostic in buffer
	-- vim.keymap.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	-- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor

	if client.name == "pyright" then
		vim.keymap.set("n", "<leader>oi", "<cmd>PyrightOrganizeImports<cr>", opts)
	end
end

return M
