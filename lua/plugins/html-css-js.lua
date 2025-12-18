return {
  {
    "ngtuonghy/live-server-nvim",
    event = "VeryLazy",
    build = ":LiveServerInstall",
    config = function()
      require("live-server-nvim").setup({
        custom = {
          "--port=8080",
          "--no-css-inject",
        },
        serverPath = vim.fn.stdpath("data") .. "/live-server/", -- server install path
        open = "folder", -- folder|cwd will open the dir, file will open the file
      })
    end,
  },
  -- Emmet for HTML/CSS
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascript", "typescript" },
    config = function()
      vim.g.user_emmet_leader_key = "<C-Z>"
    end,
  },
  -- Color preview for CSS
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        filetypes = { "css", "scss", "html", "javascript", "typescript" },
        user_default_options = {
          RGB = true,
          RRGGBB = true,
          names = true,
          RRGGBBAA = true,
          css = true,
          css_fn = true,
        },
      })
    end,
  },
  -- Example keymaps you can add:
  vim.keymap.set("n", "<leader>ls", ":LiveServerStart<CR>", { desc = "Start Live Server" }),
  vim.keymap.set("n", "<leader>lt", ":LiveServerToggle<CR>", { desc = "Toggle Live Server" }),
  vim.keymap.set("n", "<leader>lx", ":LiveServerStop<CR>", { desc = "Stop Live Server" }),
}
