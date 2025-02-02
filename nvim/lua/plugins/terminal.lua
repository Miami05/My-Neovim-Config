return {
    "akinsho/toggleterm.nvim",
    config = function()
        local colors = {
            -- Tokyo Night colors
            tokyo = {
                bg = "#1a1b26",
                border = "#3d59a1",
                float_bg = "#16161e",
            },
            -- Catppuccin Mocha colors
            catppuccin = {
                bg = "#1e1e2e",
                border = "#89b4fa",
                float_bg = "#181825",
            },
        }

        -- Choose which theme colors to use
        local theme = colors.tokyo -- or colors.catppuccin

        require("toggleterm").setup({
            open_mapping = [[<C-j>]],
            -- Better UI settings
            direction = "horizontal",
            size = 20,
            shade_terminals = true,
            shading_factor = 2,
            -- Color settings
            highlights = {
                Normal = {
                    guibg = theme.bg,
                },
                NormalFloat = {
                    guibg = theme.float_bg,
                },
                FloatBorder = {
                    guifg = theme.border,
                    guibg = theme.float_bg,
                },
            },
            -- Float window settings
            float_opts = {
                border = "curved",
                winblend = 3,
            },
        })
        -- Define keymaps for different layouts
        vim.keymap.set("n", "<leader>j", ":ToggleTerm 1 direction=horizontal<CR>", { silent = true })
        vim.keymap.set("n", "<leader>2", ":ToggleTerm 2 direction=horizontal<CR>", { silent = true })
        vim.keymap.set("n", "<leader>3", ":ToggleTerm 3 direction=horizontal<CR>", { silent = true })
        -- Optional: Add additional keymaps for different terminal layouts
        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
        end

        vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    end,
}
