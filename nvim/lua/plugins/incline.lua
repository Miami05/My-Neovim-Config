return {
  "b0o/incline.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local devicons = require("nvim-web-devicons")
    require("incline").setup({
      highlight = {
        groups = {
          InclineNormal = { guibg = "#ff80bf", guifg = "#1a1b26" },
          InclineNormalNC = { default = true, group = "CursorLine" },
        },
      },
      window = {
        margin = { vertical = 0, horizontal = 1 },
        padding = 1,
        placement = { horizontal = "center", vertical = "top" },
        width = "fit",
        winhighlight = {
          active = { Normal = "InclineNormal", InclineNormal = "InclineNormal" },
          inactive = { Normal = "InclineNormalNC", InclineNormalNC = "InclineNormalNC" },
        },
        zindex = 1000,
      },
      render = function(props)
        local buf = props.buf
        local bufname = vim.api.nvim_buf_get_name(buf)
        local filename = vim.fn.fnamemodify(bufname, ":t")
        if filename == "" then
          filename = "[No Name]"
        end
        local ft_icon, ft_color = devicons.get_icon_color(filename, vim.bo[buf].filetype, { default = true })
        local modified = vim.bo[buf].modified
        -- Git diff signs
        local signs = vim.b[buf].gitsigns_status_dict or {}
        local git_changes = {}
        if signs.added and signs.added > 0 then
          table.insert(git_changes, { " +" .. signs.added, "DiffAdd" })
        end
        if signs.changed and signs.changed > 0 then
          table.insert(git_changes, { " ~" .. signs.changed, "DiffChange" })
        end
        if signs.removed and signs.removed > 0 then
          table.insert(git_changes, { " -" .. signs.removed, "DiffDelete" })
        end
        -- LSP Diagnostics
        local function get_diag_count(severity)
          local diags = vim.diagnostic.get(buf, { severity = severity })
          return #diags
        end
        local diag = {}
        local error_count = get_diag_count(vim.diagnostic.severity.ERROR)
        local warn_count = get_diag_count(vim.diagnostic.severity.WARN)
        local info_count = get_diag_count(vim.diagnostic.severity.INFO)
        if error_count > 0 then
          table.insert(diag, { "  " .. error_count, "DiagnosticError" })
        end
        if warn_count > 0 then
          table.insert(diag, { "  " .. warn_count, "DiagnosticWarn" })
        end
        if info_count > 0 then
          table.insert(diag, { "  " .. info_count, "DiagnosticInfo" })
        end
        -- Final render
        return {
          { ft_icon, guifg = ft_color },
          { " " },
          { filename, gui = modified and "bold,italic" or "bold", guifg = "#FFFFFF" },
          modified and { " ●", guifg = "#FFFFFF" } or "", -- modified indicator
        }
      end,
    })
  end,
}
