return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate left" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate down" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate up" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate right" },
      { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Navigate previous" },
    },
  },

  {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup({
        copy_sync = {
          enable = true,
          sync_clipboard = true,
        },
        navigation = {
          enable_default_keybindings = true,
        },
        resize = {
          enable_default_keybindings = true,
        },
      })
    end,
    keys = {
      { "<A-h>", "<cmd>lua require('tmux').move_left()<cr>", desc = "Tmux left" },
      { "<A-j>", "<cmd>lua require('tmux').move_bottom()<cr>", desc = "Tmux down" },
      { "<A-k>", "<cmd>lua require('tmux').move_top()<cr>", desc = "Tmux up" },
      { "<A-l>", "<cmd>lua require('tmux').move_right()<cr>", desc = "Tmux right" },
    },
  },
}
