return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",

      -- Adapters
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-jest",
    },
    config = function()
      local neotest = require("neotest")

      neotest.setup({
        adapters = {
          require("neotest-python")({
            runner = "pytest",
          }),
          require("neotest-go")({}),
          require("neotest-jest")({
            jestCommand = "npm test --",
          }),
        },
      })
    end,
    keys = {
      -- Run
      {
        "<leader>tr",
        function()
          require("neotest").run.run()
        end,
        desc = "Test: Run nearest",
      },
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Test: Run file",
      },
      {
        "<leader>ta",
        function()
          require("neotest").run.run(vim.loop.cwd())
        end,
        desc = "Test: Run all (cwd)",
      },

      -- UI
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Test: Summary",
      },
      {
        "<leader>to",
        function()
          require("neotest").output.open({ enter = true, auto_close = true })
        end,
        desc = "Test: Output",
      },
      {
        "<leader>tO",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Test: Output panel",
      },

      -- Stop
      {
        "<leader>tq",
        function()
          require("neotest").run.stop()
        end,
        desc = "Test: Stop",
      },
    },
  },

  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("coverage").setup()
    end,
    keys = {
      { "<leader>cc", "<cmd>Coverage<cr>", desc = "Coverage: Load" },
      { "<leader>ct", "<cmd>CoverageToggle<cr>", desc = "Coverage: Toggle signs" },
      { "<leader>cu", "<cmd>CoverageSummary<cr>", desc = "Coverage: Summary" },
      { "<leader>cl", "<cmd>CoverageLoad<cr>", desc = "Coverage: Reload" },
    },
  },
}
