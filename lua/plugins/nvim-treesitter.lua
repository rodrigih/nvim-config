local config = function()
  require('nvim-treesitter.configs').setup({
    auto_install = true,
    ensure_installed = {
      "c",
      "c_sharp",
      "cpp",
      "css",
      "diff",
      "dockerfile",
      "elixir",
      "gitcommit",
      "gitignore",
      "javascript",
      "jsdoc",
      "json",
      "lua",
      "python",
      "rust",
      "sql",
      "typescript",
    }
  })
end

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  config = config
}
