return {
  {
    "mfussenegger/nvim-dap",
    dependencies = { "mfussenegger/nvim-dap-python" },
    ft = { "python" },
    config = function()
      local dap = require("dap")
      local prompt_args = require("config.dap_args").prompt_args

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
          name = "Launch file (args prompt)",
          program = "${file}",
          pythonPath = py,
          cwd = vim.fn.getcwd(),
          stopOnEntry = true,
          justMyCode = false,
          args = prompt_args,
        },
      }
    end,
  },
}
