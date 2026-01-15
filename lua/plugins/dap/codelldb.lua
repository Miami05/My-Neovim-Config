return {
  {
    "mfussenegger/nvim-dap",
    ft = { "c", "cpp" },
    config = function()
      local dap = require("dap")
      local prompt_args = require("config.dap_args").prompt_args

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }

      dap.configurations.cpp = {
        {
          name = "Launch file (args prompt)",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          args = prompt_args,
          cwd = vim.fn.getcwd(),
          stopOnEntry = false,
          stopAtBeginningOfMainSubprogram = true,
          setupCommands = { { text = "break set -n main" } },
          runInTerminal = true,
        },
      }
      dap.configurations.c = dap.configurations.cpp
    end,
  },
}
