return {
  "pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true,
      execution_message = {
        message = function()
          return ""
        end,
      },
      trigger_events = { "InsertLeave", "TextChanged" }, -- Save on these events
      write_all_buffers = true,
    })
  end,
}
