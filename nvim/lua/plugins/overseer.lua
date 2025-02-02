return {
	"stevearc/overseer.nvim",
	event = "VeryLazy",
	config = function()
		local overseer = require("overseer")

		overseer.setup({
			strategy = "toggleterm", -- Runs tasks in a terminal
		})

		-- Automatically run `make` when any file is saved
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = "*", -- Matches all file types
			callback = function()
				overseer.run_template({ name = "make" })
			end,
		})

		-- Keymaps for Overseer
		vim.keymap.set("n", "<leader>ot", "<cmd>OverseerToggle<CR>", { desc = "Toggle Overseer Task List" })
		vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<CR>", { desc = "Run a Task" })
		vim.keymap.set("n", "<leader>os", "<cmd>OverseerStop<CR>", { desc = "Stop a Task" })
		vim.keymap.set("n", "<leader>ol", "<cmd>OverseerLoadBundle<CR>", { desc = "Load Task Bundle" })
		vim.keymap.set("n", "<leader>oq", "<cmd>OverseerQuickAction<CR>", { desc = "Quick Action on Task" })
	end,
}
