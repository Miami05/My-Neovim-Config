return {
    "alexandregv/norminette-vim",
    lazy = false,
    config = function()
        -- Enable norminette-vim (not required if you want to run it manually)
        vim.g.norminette_auto = 1

        -- Set the norminette path (modify if needed)
        vim.g.norminette_path = "norminette"

        -- Custom mappings for norminette
        vim.keymap.set("n", "<leader>nn", ":Norminette<CR>", { silent = true })
        vim.keymap.set("n", "<leader>nf", ":NorminetteFix<CR>", { silent = true })

        -- Automatically run norminette on save for C files (optional)
        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = "*.c,*.h",
            callback = function()
                if vim.g.norminette_auto == 1 then
                    vim.cmd("Norminette")
                end
            end,
        })

        -- Set up custom highlighting for norminette errors (optional)
        vim.api.nvim_set_hl(0, "NormError", { fg = "#ff0000" })
        vim.api.nvim_set_hl(0, "NormWarning", { fg = "#ffff00" })
    end,
}
