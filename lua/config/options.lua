-- ####################
--      Vim Options
-- ####################

local opt = vim.opt

--  Allow GUI Colours
opt.termguicolors = true

-- Add line numbers
opt.number = true

-- Set fold method
opt.foldmethod = "syntax"

-- Split options
opt.splitright = true
opt.splitbelow = true

-- Tab/Indentation settings
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
