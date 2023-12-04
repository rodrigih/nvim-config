local keymap = vim.keymap

local config = function()
    require('nvim-tree').setup({
      view = {
        float = { enable = true }
      }
    })
end

return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  config = config,
}
