return {
  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = { "mfussenegger/nvim-dap" },
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      local dap = require("dap")
      local prompt_args = require("config.dap_args").prompt_args

      require("dap-vscode-js").setup({
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
      })

      for _, language in ipairs({ "javascript", "typescript" }) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file (args prompt)",
            program = "${file}",
            cwd = "${workspaceFolder}",
            args = prompt_args,
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach (pick process)",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end
    end,
  },
}
