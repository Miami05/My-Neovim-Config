return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections.lualine_c[4] = {
      LazyVim.lualine.pretty_path({
        length = 0,
        relative = "cwd",
        modified_hl = "MatchParen",
        directory_hl = "",
        filename_hl = "Bold",
        modified_sign = "",
        readonly_icon = " 󰌾 ",
      }),
    }
    -- Add UTF-8 encoding display
    table.insert(opts.sections.lualine_y, {
      "encoding",
      fmt = function(str)
        return str:upper()
      end,
    })
  end,
}
