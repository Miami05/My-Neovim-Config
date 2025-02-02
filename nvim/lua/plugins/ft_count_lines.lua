return {
    "FtVim/ft_count_lines.nvim",
    config = function()
        require("ft_count_lines").setup({
            enable_on_start = true,
            display_mode = "floating", -- or "statusline" or "notification"
            format = "Total: %d lines, Current: %d (%.1f%%)"
        })
    end,
}
