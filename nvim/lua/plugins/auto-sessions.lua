return {
  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      vim.opt.sessionoptions:append("localoptions")
      require("auto-session").setup({
        log_level = "info",
        auto_session_enable_last_session = false,
        auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
        auto_session_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = false,
        auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
        sessionoptions = { "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal, localoptions" },
      })
      -- Save and Restore session keymaps
      vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save Session" })
      vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore Session" })
    end,
  },
  {
    "rmagatti/session-lens",
    dependencies = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
    config = function()
      require("session-lens").setup({
        path_display = { "shorten" },
        theme_conf = { border = true },
        previewer = false,
      })
      -- Keymap to open session list with Telescope
      vim.keymap.set("n", "<leader>sl", "<cmd>Telescope session-lens search_session<CR>", { desc = "Browse Sessions" })

      -- Keymap to delete a session
      vim.keymap.set("n", "<leader>sd", function()
        local session_path = vim.fn.input("Session to delete: ", "", "file")
        if session_path ~= "" then
          vim.cmd("!rm " .. session_path)
          print("Session " .. session_path .. " deleted!")
        end
      end, { desc = "Delete Session" })
    end,
  },
}
