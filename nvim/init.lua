-- bootstrap lazy.nvim, LazyVim and your plugins

-- General settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.syntax = "on"
vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.opt.termguicolors = true

-- Tabs and indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false

-- Searching
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true

-- File handling
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- UI improvements
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.showmode = false

-- Set the Nerd Font in Neovim GUI (like Neovide or nvim-qt)
vim.o.guifont = "FiraCode Nerd Font:h14"

require("config.lazy")
