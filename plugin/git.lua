vim.pack.add({
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})

require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
		end

		map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
		map("n", "<leader>gb", gs.blame_line, "Blame Line")
		map("n", "<leader>gt", gs.toggle_current_line_blame, "Toggle Current Line Blame")
		map("n", "<leader>gd", gs.diffthis, "Diff This")
		map("n", "<leader>gD", function()
			gs.diffthis("~")
		end, "Diff This ~")
	end,
})
