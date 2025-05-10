return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "pyright", "sqlls", "cmake", "bashls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- LSP configurations
      local lspconfig = require("lspconfig")

      -- Setup language servers here
      lspconfig.lua_ls.setup({
        -- Configuration for Lua LSP
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Find references" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Trigger code actions" })
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
    end,
  },
}
