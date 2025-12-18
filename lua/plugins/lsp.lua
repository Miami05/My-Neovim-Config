-- lsp.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local caps = vim.lsp.protocol.make_client_capabilities()
    local on_attach = function(_, bufnr)
      local map = function(m, lhs, rhs, desc)
        vim.keymap.set(m, lhs, rhs, { buffer = bufnr, desc = desc })
      end
      map("n", "K", vim.lsp.buf.hover, "Hover")
      map("n", "gd", vim.lsp.buf.definition, "Definition")
      map("n", "gD", vim.lsp.buf.declaration, "Declaration")
      map("n", "<leader>gr", vim.lsp.buf.references, "References")
      map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
      map("n", "<space>rn", vim.lsp.buf.rename, "Rename")
    end

    -- Lua
    lspconfig.lua_ls.setup({
      capabilities = caps,
      on_attach = on_attach,
      settings = { Lua = { diagnostics = { globals = { "vim" } }, workspace = { checkThirdParty = false } } },
    })

    -- Python
    lspconfig.pyright.setup({
      capabilities = caps,
      on_attach = on_attach,
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
    lspconfig.ruff_lsp.setup({ capabilities = caps, on_attach = on_attach })

    -- TypeScript/JS (match the mason ID)
    lspconfig.ts_ls.setup({ capabilities = caps, on_attach = on_attach })
    -- If you prefer VTSLS instead:
    -- lspconfig.vtsls.setup({ capabilities = caps, on_attach = on_attach })

    -- Web
    lspconfig.eslint.setup({ capabilities = caps, on_attach = on_attach })
    lspconfig.html.setup({ capabilities = caps, on_attach = on_attach, filetypes = { "html", "templ" } })
    lspconfig.cssls.setup({ capabilities = caps, on_attach = on_attach })
    lspconfig.emmet_ls.setup({
      capabilities = caps,
      on_attach = on_attach,
      filetypes = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "jsx", "tsx" },
    })
    lspconfig.quick_lint_js.setup({ capabilities = caps, on_attach = on_attach })

    -- JSON / YAML (OpenAPI schemas)
    lspconfig.jsonls.setup({
      capabilities = caps,
      on_attach = on_attach,
      settings = {
        json = {
          schemas = {
            {
              fileMatch = { "swagger.json", "openapi.json", "**/swagger/*.json" },
              url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json",
            },
          },
          validate = { enable = true },
        },
      },
    })
    lspconfig.yamlls.setup({
      capabilities = caps,
      on_attach = on_attach,
      settings = {
        yaml = {
          schemas = {
            ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
              "docker-compose*.yml",
              "docker-compose*.yaml",
              "infra/docker-compose.yml",
            },
            ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json"] = {
              "swagger.yaml",
              "openapi.yaml",
              "**/swagger/*.yaml",
              "**/openapi/*.yaml",
            },
          },
          validate = true,
        },
      },
    })

    lspconfig.dockerls.setup({ capabilities = caps, on_attach = on_attach })

    -- Docker Compose LSP (extra smarts for compose files)
    lspconfig.docker_compose_language_service.setup({
      capabilities = caps,
      on_attach = on_attach,
    })
    -- C/C++
    lspconfig.clangd.setup({ capabilities = caps, on_attach = on_attach })

    -- SQL
    lspconfig.sqls.setup({ capabilities = caps, on_attach = on_attach })

    -- OPTIONAL: Redis custom server (only if you really need it)
    -- Requires `redis-lsp` binary in PATH (install via Mason: "redis-lsp")
    local configs = require("lspconfig.configs")
    if not configs.redis then
      configs.redis = {
        default_config = {
          cmd = { "redis-lsp" },
          filetypes = { "redis", "conf" },
          root_dir = lspconfig.util.root_pattern(".git", "."),
        },
      }
    end
    lspconfig.redis.setup({ capabilities = caps, on_attach = on_attach })
  end,
}
