vim.pack.add({ "https://github.com/echasnovski/mini.icons" })

vim.pack.add({ "https://github.com/goolord/alpha-nvim" })

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		require("alpha").setup(require("alpha.themes.startify").config)
	end,
})
