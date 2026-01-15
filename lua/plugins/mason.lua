-- mason.lua
return {
  {
    --  plugin renamed; use the new org
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim", -- still the same slug
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        -- IMPORTANT: lspconfig server IDs only
        ensure_installed = {
          -- Core
          "lua_ls",
          "bashls",
          "jsonls",
          "yamlls",

          -- Python
          "pyright",
          "ruff", -- maps to ruff_lsp in lspconfig

          -- Web
          "vtsls", -- or "vtsls" if you prefer
          "eslint",
          "html",
          "cssls",
          "emmet_ls",
          "quick_lint_js",

          -- C / C++
          "clangd",
          "cmake",

          -- SQL
          "sqlls",
        },
        automatic_installation = true,
      })
    end,
  },
}
