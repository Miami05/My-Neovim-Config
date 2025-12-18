return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "mason-org/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "mfussenegger/nvim-dap-python",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("mason-nvim-dap").setup({
      ensure_installed = { "codelldb", "python" },
      automatic_installation = true,
    })

    -- CodeLLDB adapter
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
        args = { "--port", "${port}" },
      },
    }

    -- C/C++
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        args = function()
          local s = vim.fn.input("Arguments (optional): ")
          if s == "" then
            return {}
          end
          local out = {}
          for a in string.gmatch(s, "%S+") do
            table.insert(out, a)
          end
          return out
        end,
        cwd = vim.fn.getcwd(),

        -- ✅ Stop *at main*, not in the loader:
        stopOnEntry = false,
        stopAtBeginningOfMainSubprogram = true,

        -- (Optional) also set a breakpoint on main as a fallback:
        setupCommands = {
          { text = "break set -n main" },
        },

        -- If you like a real terminal for stdin/stdout:
        runInTerminal = true,
      },
    }
    dap.configurations.c = dap.configurations.cpp

    -- Python (unchanged, just here for completeness)
    local py = (vim.fn.exepath("python3") ~= "" and vim.fn.exepath("python3")) or "python"
    local venv_python = vim.fn.getcwd() .. "/venv/bin/python"
    if vim.fn.executable(venv_python) == 1 then
      py = venv_python
    end
    require("dap-python").setup(py)
    require("dap-python").test_runner = "pytest"
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = py,
        cwd = vim.fn.getcwd(),
        stopOnEntry = true, -- for Python this is convenient
        justMyCode = false,
        args = function()
          local s = vim.fn.input("Arguments (optional): ")
          if s == "" then
            return {}
          end
          local out = {}
          for a in string.gmatch(s, "%S+") do
            table.insert(out, a)
          end
          return out
        end,
      },
    }

    -- UI (leave it open after exit so you can read output)
    dapui.setup()
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    -- don’t auto-close on exit so you can inspect output/logs

    -- Keys
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<F5>", dap.continue, opts)
    vim.keymap.set("n", "<F2>", dap.step_over, opts)
    vim.keymap.set("n", "<F3>", dap.step_into, opts)
    vim.keymap.set("n", "<F12>", dap.step_out, opts)
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, opts)
    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, opts)

    require("dap").set_log_level("TRACE")
  end,
}
