-- ####################
--    Auto commands
-- ####################

local autocmd = vim.api.nvim_create_autocmd

-- Opens NvimTree on nvim startup if no file is specified
autocmd({ "VimEnter" }, {
  pattern = { "*" },
  command = 'if argc() == 0 && !exists("s:std_in") | NvimTreeToggle | endif'
});

-- Manually start treesitter for Elixir
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "elixir", "heex", "eex" },
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
