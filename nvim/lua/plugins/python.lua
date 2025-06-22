return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
    },
    lazy = false,
    branch = "regexp",
    config = function()
      require("venv-selector").setup({})
    end,
    keys = {
      { "<leader>ps", "<cmd>VenvSelect<cr>", desc = "Select Python Virtual Environment" },
    },
  },
  -- REST client (Postman alternative)
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.g.rest_nvim = {
        result_split_horizontal = false,
        result_split_in_place = false,
        skip_ssl_verification = false,
        encode_url = true,
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          show_url = true,
          show_curl_command = false,
          show_http_info = true,
          show_headers = true,
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end,
          },
        },
        jump_to_request = false,
        env_file = ".env",
        custom_dynamic_variables = {},
        yank_dry_run = true,
      }
    end,
    keys = {
      { "<leader>rr", "<Plug>RestNvim", desc = "Run REST request" },
      { "<leader>rp", "<Plug>RestNvimPreview", desc = "Preview REST request" },
      { "<leader>rl", "<Plug>RestNvimLast", desc = "Re-run last REST request" },
    },
  },
}
