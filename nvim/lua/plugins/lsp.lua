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
        ensure_installed = {
          -- Python/Flask tools
          "pyright",
          "ruff",
          "black",
          "isort",
          "flake8",
          -- Web development
          "typescript-language-server",
          "eslint-lsp",
          "prettier",
          "html-lsp",
          "css-lsp",
          "emmet-ls",
          "json-lsp",
          "yaml-language-server",
          "quick-lint-js",
          "vtsls",
          -- SQL
          "sqlls",
          "sql-formatter",
          -- Redis
          "redis-lsp", -- If available
          -- Lua
          "lua_ls",
          "lua-language-server",
          "stylua",
          -- C/C++
          "clangd",
          "cmake",
          -- Bash
          "bashls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      servers = {
        -- Python/Flask
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                autoImportCompletions = true,
              },
            },
          },
        },
        ruff_lsp = {}, -- Fast Python linter
        -- Web technologies
        tsserver = {},
        eslint = {},
        html = {
          filetypes = { "html", "templ" },
        },
        cssls = {},
        emmet_ls = {
          filetypes = { "html", "css", "javascript", "typescript", "jsx", "tsx" },
        },
        -- SQL
        sqlls = {},
        -- JSON (for APIs and Swagger specs)
        jsonls = {
          settings = {
            json = {
              schemas = {
                {
                  fileMatch = { "swagger.json", "openapi.json", "**/swagger/*.json" },
                  url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json",
                },
                {
                  fileMatch = { "swagger.yaml", "openapi.yaml", "**/swagger/*.yaml" },
                  url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.yaml",
                },
              },
            },
          },
        },
        -- YAML (for Swagger/OpenAPI specs)
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json"] = {
                  "swagger.yaml",
                  "openapi.yaml",
                  "**/swagger/*.yaml",
                  "**/openapi/*.yaml",
                },
              },
            },
          },
        },
      },
    },
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

    lspconfig.clangd.setup({
      -- Optional: more specific configuration
      cmd = { "clangd" },
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
      single_file_support = true,

      -- Optional: customize capabilities if needed
      capabilities = vim.lsp.protocol.make_client_capabilities(),

      -- Optional: on_attach function for additional setup
      on_attach = function(client, bufnr)
        -- You can add additional keymaps or LSP-specific settings here
        -- For example:
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Show hover information" })
      end,
    })

    -- ADD THIS: TypeScript/JavaScript Language Server
    lspconfig.vtsls.setup({
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html" },
      capabilities = vim.lsp.protocol.make_client_capabilities(),
      on_attach = function(client, bufnr)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Show hover information" })
      end,
    })
    -- Also add other servers you have in opts but aren't configured:
    lspconfig.pyright.setup({
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            autoImportCompletions = true,
          },
        },
      },
    })

    -- HTML Language Server (enhanced for JS)
    lspconfig.html.setup({
      filetypes = { "html", "templ" },
      capabilities = vim.lsp.protocol.make_client_capabilities(),
      settings = {
        html = {
          format = {
            templating = true,
            wrapLineLength = 120,
            wrapAttributes = "auto",
          },
          hover = {
            documentation = true,
            references = true,
          },
        },
      },
    })

    lspconfig.cssls.setup({})

    -- Emmet with enhanced JS support in HTML
    lspconfig.emmet_ls.setup({
      filetypes = { "html", "css", "javascript", "typescript", "jsx", "tsx" },
      init_options = {
        html = {
          options = {
            ["bem.enabled"] = true,
          },
        },
        javascript = {
          options = {
            ["jsx.enabled"] = true,
          },
        },
      },
    })

    lspconfig.jsonls.setup({
      settings = {
        json = {
          schemas = {
            {
              fileMatch = { "swagger.json", "openapi.json", "**/swagger/*.json" },
              url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json",
            },
            {
              fileMatch = { "swagger.yaml", "openapi.yaml", "**/swagger/*.yaml" },
              url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.yaml",
            },
          },
        },
      },
    })

    -- Keymaps (your existing ones)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Find references" })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Trigger code actions" })
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
  end,
}
