-- ####################
--    Colour Schemes
-- ####################

vim.o.background = "light"
--vim.cmd.colorscheme('everforest')
--vim.cmd.colorscheme('melange')
--vim.cmd.colorscheme 'melange'
--vim.cmd.colorscheme 'kanagawa'

-- ####################
--    Plugins
-- ####################

-- Plugin location: ~/.local/share/nvim/site/pack/plugins/start

-- ####################
--    Lazy.nvim (plugin manager)
-- ####################
require('config')

-- ####################
--    Plugins - ALE
-- ####################
-- vim.g.ale_fix_on_save = 1
-- vim.g.ale_linters = {
--         ['javascript'] = {'eslint', 'prettier'},
--         ['typescript'] = {'eslint', 'prettier'},
--         ['typescriptreact'] = {'eslint', 'prettier'},
--         ['python'] = {'black'}
-- }
-- vim.g.ale_fixers = {
--         ['javascript'] = {'eslint', 'prettier'},
--         ['typescript'] = {'eslint', 'prettier'},
--         ['typescriptreact'] = {'eslint', 'prettier'},
--         ['python'] = {'black'},
--         ['elixir'] = {'mix_format'}
-- }
--
-- --vim.keymap.set("n", "<leader>p", ":ALEFix<Enter>");
-- vim.keymap.set('n', '<leader>j', "<cmd>ALENextWrap<cr>", {})
-- vim.keymap.set('n', '<leader>k', "<cmd>ALEPreviousWrap<cr>", {})

-- ####################
--    Plugins - nvim-web-devicons
-- ####################
require'nvim-web-devicons'.setup()

-- ####################
--    Plugins - Harpoon
-- ####################
-- local harpoonMark = require("harpoon.mark")
-- vim.keymap.set("n", "<leader>ht", harpoonMark.toggle_file, {})
-- vim.keymap.set("n", "<leader>hc", harpoonMark.clear_all, {})
-- vim.keymap.set("n", "<leader>hl", "<cmd>Telescope harpoon marks<cr>", {})

-- ####################
--    Plugins - Mason
-- ####################
-- require("mason").setup()
