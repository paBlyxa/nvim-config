vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "v0.2.0" },
})

-- build = 'make' for telescope-fzf-native → run manually once after install
-- open a terminal and run: cd ~/.local/share/nvim/site/pack/core/opt/telescope-fzf-native.nvim && make

local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Telescope grep string under cursor" })
vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
vim.keymap.set("n", "<leader>fg", function()
	builtin.live_grep({
		layout_config = {
			width = 0.9,
			preview_width = 0.5,
		},
	})
end, { desc = "Telescope live grep" })
