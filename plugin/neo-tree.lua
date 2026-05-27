vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = "v3.x" },
})

vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", {})
require("neo-tree").setup({
	window = {
		mappings = {
			["P"] = {
				"toggle_preview",
				config = {
					use_float = false,
				},
			},
		},
	},
})
