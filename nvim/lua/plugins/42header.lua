return {
  "42Paris/42header",
  lazy = false,
  config = function()
    vim.g.user42 = "ldurmish"
    vim.g.mail42 = " ldurmish@student.42wolfsburg.de"
    vim.keymap.set("n", "<F1>", ":Stdheader<CR>", { silent = true })
  end,
}
