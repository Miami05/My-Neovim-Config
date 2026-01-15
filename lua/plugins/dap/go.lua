return {
  {
    "leoluz/nvim-dap-go",
    dependencies = { "mfussenegger/nvim-dap" },
    ft = { "go" },
    config = function()
      require("dap-go").setup({
        dap_configurations = {
          {
            type = "go",
            name = "Debug file (args prompt)",
            request = "launch",
            program = "${file}",
            args = require("dap-go").get_arguments,
          },
        },
      })
    end,
    keys = {
      {
        "<leader>dt",
        function()
          require("dap-go").debug_test()
        end,
        ft = "go",
        desc = "DAP-Go Debug test",
      },
      {
        "<leader>dT",
        function()
          require("dap-go").debug_last_test()
        end,
        ft = "go",
        desc = "DAP-Go Debug last test",
      },
    },
  },
}
