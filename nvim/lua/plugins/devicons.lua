return {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    priority = 1000,
    config = function()
        require("nvim-web-devicons").setup({
            strict = true,
            override_by_extension = {
                ["lua"] = {
                    icon = "",
                    color = "#51a0cf",
                    name = "Lua",
                },
            },
        })
    end,
}
