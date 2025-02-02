return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 
            'nvim-lua/plenary.nvim'
        },
        config = function()
        local telescope = require('telescope')
        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = "move_selection_next",
                        ["<C-k>"] = "move_selection_previous",
                    }
                }
            }
        })
        -- Telescope keymaps using Ctrl
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Find files' })
        vim.keymap.set('n', '<leader>l', builtin.live_grep, { desc = 'Live grep' })
        vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Find buffers' })
        vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Help tags' })
        end,
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {

                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    },
}
