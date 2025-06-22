return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "mfussenegger/nvim-dap-python",
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

    -- Configure Python adapter
    dap.adapters.python = {
      type = "executable",
      command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
      args = { "-m", "debugpy.adapter" },
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
            return {}
          end
          local args = {}
          for arg in string.gmatch(args_str, "%S+") do
            table.insert(args, arg)
          end
          return args
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
    dap.configurations.c = dap.configurations.cpp

    -- Configure Python launch configurations
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          local venv_python = vim.fn.getcwd() .. "/venv/bin/python"
          if vim.fn.executable(venv_python) == 1 then
            return venv_python
          end
          return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
        end,
        args = function()
          local args_str = vim.fn.input("Arguments (optional): ")
          if args_str == "" then
            return {}
          end
          local args = {}
          for arg in string.gmatch(args_str, "%S+") do
            table.insert(args, arg)
          end
          return args
        end,
        cwd = vim.fn.getcwd(),
        console = "integratedTerminal",
      },
    }

    -- Setup DAP UI
    dapui.setup()

    -- Key mappings
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<F5>", dap.continue, opts)
    vim.keymap.set("n", "<F2>", dap.step_over, opts)
    vim.keymap.set("n", "<F3>", dap.step_into, opts)
    vim.keymap.set("n", "<F12>", dap.step_out, opts)
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, opts)
    vim.keymap.set("n", "<leader>B", dap.set_breakpoint, opts)

    -- Auto open/close DAP UI
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
