-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Disable formatting for C files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.b.autoformat = false
  end,
})

-- General settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.syntax = "on"
vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.opt.termguicolors = true

-- Tabs and indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

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

vim.opt.winbar = "%=%m %f"
