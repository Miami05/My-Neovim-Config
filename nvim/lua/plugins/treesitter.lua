return {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'windwp/nvim-ts-autotag',
        },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {"c", "cpp", "python", "sql", "cmake", "make", "ninja", "markdown", "bash"},
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<CR>",
                        node_incremental = "<CR>",
                        node_decremental = "<BS>",
                        scope_incremental = "<S-CR>",
                    },
                },
            })
        end
}

