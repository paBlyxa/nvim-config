vim.pack.add({
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/SmiteshP/nvim-navic" },
	{ src = "https://github.com/SmiteshP/nvim-navbuddy" },
})

require("nvim-navic").setup({
	highlight = true,
	separator = " > ",
	depth_limit = 5,
})

require("nvim-navbuddy").setup({
	window = {
		border = "single",
		size = "75%",
		position = "50%",
		sections = {
			left = {
				size = "20%",
			},
			mid = {
				size = "30%",
			},
			right = {
				preview = "leaf",
			},
		},
	},
	use_default_mappings = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("NavicAttach", {}),
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client.server_capabilities.documentSymbolProvider then
			require("nvim-navic").attach(client, ev.buf)
			require("nvim-navbuddy").attach(client, ev.buf)
		end
	end,
})

vim.keymap.set("n", "<leader>nb", "<cmd>Navbuddy<CR>", { desc = "Open Navbuddy" })
