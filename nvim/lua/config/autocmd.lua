-- ####################
--    Auto commands
-- ####################

local autocmd = vim.api.nvim_create_autocmd

-- Opens NvimTree on nvim startup if no file is specified
autocmd({"VimEnter"}, {
  pattern = {"*"},
  command = 'if argc() == 0 && !exists("s:std_in") | NvimTreeToggle | endif'
});
