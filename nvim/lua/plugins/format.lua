return {
  "Diogo-ss/42-C-Formatter.nvim",
  cmd = "CFormat42",
  keys = {
    { "<F2>", ":CFormat42<CR>", mode = "n", silent = true },  -- Normal mode: Format the whole file
    { "<F2>", ":'<,'>CFormat42<CR>", mode = "v", silent = true }, -- Visual mode: Format selected text
  },
  config = function()
    local formatter = require("42-formatter")
    formatter.setup({
      formatter = "c_formatter_42",
      filetypes = {
        c = true,
        h = true,
        cpp = true,
        hpp = true,
      },
    })

    -- Auto-format before saving the file
    local formatgrp = vim.api.nvim_create_augroup("C_format_42", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = formatgrp,
      pattern = { "*.c", "*.h", "*.cpp", "*.hpp" },
      callback = function()
        if vim.fn.exists(":CFormat42") == 2 then
          vim.cmd("CFormat42")
        end
      end,
    })
  end,
}

