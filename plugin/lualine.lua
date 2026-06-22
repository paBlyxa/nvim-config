vim.pack.add({
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
})

local lualine = require("lualine")
lualine.setup({
	options = {
		theme = "everforest",
	},
	sections = {
		lualine_c = {
			{
				"filename",
				path = 1,
			},
		},
		lualine_x = {
			{ "encoding" },
			{ "fileformat" },
			{ "filetype" },
		},
	},
	winbar = {
		lualine_b = { { "filename", path = 1 } },
		lualine_c = {
			{
				function()
					return require("nvim-navic").get_location()
				end,
				cond = function()
					return require("nvim-navic").is_available()
				end,
			},
		},
	},
	inactive_winbar = {
		lualine_b = { { "filename", path = 1, color = { fg = "#888888" } } },
		lualine_c = {
			{
				function()
					return require("nvim-navic").get_location()
				end,
				cond = function()
					return require("nvim-navic").is_available()
				end,
			},
		},
	},
})
