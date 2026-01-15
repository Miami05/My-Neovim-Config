local M = {}

function M.prompt_args()
  local s = vim.fn.input("Args (empty = none): ")
  if s == nil or s == "" then
    return {}
  end
  return vim.split(s, " +")
end

return M
