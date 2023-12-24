return {
  "rose-pine/neovim",
  version = false,
  priority = 1000,
  config = function()
    require("rose-pine").setup()
  end,
}
