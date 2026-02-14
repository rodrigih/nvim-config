-- ####################
--    Keymaps
-- ####################

local keymap = vim.keymap

-- Clipboard
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', {})
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', {})
vim.api.nvim_set_keymap("n", "<leader>v", '"+p', {})

-- NvimTree

keymap.set("n", "<C-n>", ":NvimTreeToggle<Enter>", { noremap = true, silent = true })
keymap.set("n", "<leader>t", ":NvimTreeFindFile<CR>", {})

-- Comments (plugin)
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

