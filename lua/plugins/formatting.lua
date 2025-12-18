-- formatting.lua
return {
  -- Ensure non-LSP tools are installed
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- Python
          "black",
          "isort",
          "ruff", -- also used by ruff_lsp
          "flake8",

          -- Web
          "prettier", -- or "prettierd" if you prefer the daemon
          "eslint_d",

          -- Lua
          "stylua",

          -- SQL
          "sql-formatter",
          "sqls",
        },
        auto_update = false,
        run_on_start = true,
      })
    end,
  },

  -- Run formatters
  -- Conform: use pg-formatter (Node) via npx for SQL formatting.
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = function()
      local util = require("conform.util") -- required so 'util' isn't nil
      return {
        format_on_save = { timeout_ms = 2000, lsp_fallback = true },

        -- Define project-local pg-formatter
        formatters = {
          pg_formatter_node = {
            command = "npx",
            args = { "--yes", "pg-formatter", "--no-color" },
            stdin = true,
            cwd = util.root_file({ "package.json", ".git" }),
          },
        },

        formatters_by_ft = {
          python = { "ruff_format", "isort", "black" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          lua = { "stylua" },
          sql = { "pg_formatter_node" },
        },
      }
    end,
  },

  -- (Optional) lint-on-save
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        python = { "ruff", "flake8" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
