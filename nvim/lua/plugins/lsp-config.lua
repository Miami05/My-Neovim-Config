return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "pyright", "sqlls", "cmake", "bashls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			-- Setup each LSP server
			lspconfig.lua_ls.setup({})
			lspconfig.clangd.setup({
				capabilities = {
					offsetEncoding = { "utf-16" },
				},
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--completion-style=detailed",
					"--header-insertion=iwyu",
					"--compile-commands-dir=~/Desktop/Push_Swap",
					"-j=4",
					"--all-scopes-completion",
					"--pch-storage=memory",
					"--header-insertion=never",
				},
				root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git", "Makefile"),
				filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
				init_options = {
					compilationDatabasePath = vim.loop.cwd(),
					fallbackFlags = {
						"-I.",
						"-I./include",
						"-I./libft/include",
						"-I./libft",
						"-Wall",
						"-Wextra",
						"-Werror",
						"-std=c99",
					},
				},
			})
			lspconfig.pyright.setup({})
			lspconfig.sqlls.setup({})
			lspconfig.cmake.setup({})
			lspconfig.bashls.setup({})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
		end,
	},
}
