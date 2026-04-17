vim.pack.add({
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
})

local lualine = require("lualine")
lualine.setup({
	options = {
		theme = "everforest",
	},
	sections = {
		lualine_x = {
			{ "encoding" },
			{ "fileformat" },
			{ "filetype" },
		},
	},
})
