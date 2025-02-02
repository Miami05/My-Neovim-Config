return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- Lua
                null_ls.builtins.formatting.stylua,
                -- Python
                null_ls.builtins.formatting.black,
                -- C/C++
                null_ls.builtins.formatting.clang_format,
                -- SQl
                null_ls.builtins.formatting.sqlfmt,
                -- CMake
                null_ls.builtins.formatting.gersemi,
            },
            automatic_installation = true,
        })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format buffer" })
    end,
}
