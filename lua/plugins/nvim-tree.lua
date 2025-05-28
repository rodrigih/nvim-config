local keymap = vim.keymap

local config = function()
    require('nvim-tree').setup({
      view = {
        float = { enable = true }
      },
      filters = {
        dotfiles = true
      },
      respect_buf_cwd = true,
      git = {
        enable = true,
        ignore = false
      }
    })
end

return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  config = config,
}
