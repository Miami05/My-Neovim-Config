local function open_external(ev)
  local filename = vim.fn.shellescape(ev.file)

  if vim.fn.has("mac") == 1 then
    vim.cmd("silent! !open " .. filename .. " &")
  else
    vim.cmd("silent! !xdg-open " .. filename .. " &")
  end

  vim.schedule(function()
    pcall(vim.cmd, "b#")
    pcall(vim.api.nvim_buf_delete, ev.buf, { force = true })
  end)
end

vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = { "*.pdf", "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif", "*.svg" },
  callback = open_external,
})
