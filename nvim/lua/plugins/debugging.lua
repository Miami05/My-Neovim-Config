return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Configure C/C++ adapter
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
        args = { "--port", "${port}" },
      },
    }

    -- Configure C++ launch configurations
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        args = function()
          local args_str = vim.fn.input("Arguments (optional): ")
          if args_str == "" then
            return {} -- Return empty table if no arguments provided
          end
          local args = {}
          for arg in string.gmatch(args_str, "%S+") do
            table.insert(args, arg)
          end
          return args
        end,
        cwd = vim.fn.getcwd(),
      },
    }
    dap.configurations.c = dap.configurations.cpp

    -- Setup DAP UI
    dapui.setup()

    -- Key mappings (Fixing undefined `opts`)
    local keymap_opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<F5>", function()
      dap.continue()
    end, keymap_opts)
    vim.keymap.set("n", "<F2>", function()
      dap.step_over()
    end, keymap_opts)
    vim.keymap.set("n", "<F3>", function()
      dap.step_into()
    end, keymap_opts)
    vim.keymap.set("n", "<F12>", function()
      dap.step_out()
    end, keymap_opts)
    vim.keymap.set("n", "<leader>b", function()
      dap.toggle_breakpoint()
    end, keymap_opts)
    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint()
    end, keymap_opts)

    -- Ensure DAP UI opens/closes with debugging sessions
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
