return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	main = "nvim-treesitter",
	opts = {
		install = {
			auto = true,
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start) -- highlightings
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- indent
			end,
		})
	end,
}
