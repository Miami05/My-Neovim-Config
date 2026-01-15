return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("aerial").setup({
      -- Priority list of backends
      backends = { "lsp", "treesitter", "markdown", "man" },

      -- Position the aerial window on the left side
      layout = {
        default_direction = "left",
        placement = "edge",
        width = 30,
      },

      -- Enable filtering by kind
      filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
      },

      -- Customize the appearance
      guides = {
        mid_item = "├─",
        last_item = "└─",
        nested_top = "│ ",
        whitespace = "  ",
      },

      -- Show icons for symbols
      icons = {
        Class = "󰠱 ",
        Constructor = " ",
        Enum = " ",
        Function = "󰊕 ",
        Interface = " ",
        Method = "ƒ ",
        Module = " ",
        Struct = "󰙅 ",
      },

      -- Attach aerial to buffers automatically
      attach_mode = "global",

      -- Close aerial when you jump to a symbol
      close_on_select = false,

      -- Show box drawing characters for guides
      show_guides = true,
    })

    -- Set up keymaps
    vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "Toggle aerial" })
  end,
  keys = {
    { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial sidebar" },
    { "<leader>as", "<cmd>Telescope aerial<CR>", desc = "Search symbols with Telescope" },
  },
}
