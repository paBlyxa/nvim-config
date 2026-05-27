vim.pack.add({
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/williamboman/mason-lspconfig.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

-- mason
require("mason").setup()

require("mason-tool-installer").setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"isort",
		"black",
		"eslint_d",
		"pylint",
		"gopls",
	},
})

require("mason-lspconfig").setup({
	auto_install = true,
	automatic_enable = {
		exclude = { "rust_analyzer" },
	},
})

-- lspconfig
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }

		vim.keymap.set(
			"n",
			"gR",
			"<cmd>Telescope lsp_references<CR>",
			vim.tbl_extend("force", opts, { desc = "Show LSP references" })
		)
		vim.keymap.set(
			"n",
			"gD",
			vim.lsp.buf.declaration,
			vim.tbl_extend("force", opts, { desc = "Go to declaration" })
		)
		vim.keymap.set(
			"n",
			"gd",
			"<cmd>Telescope lsp_definitions<CR>",
			vim.tbl_extend("force", opts, { desc = "Show LSP definitions" })
		)
		vim.keymap.set(
			"n",
			"gi",
			"<cmd>Telescope lsp_implementations<CR>",
			vim.tbl_extend("force", opts, { desc = "Show LSP implementations" })
		)
		vim.keymap.set(
			"n",
			"gt",
			"<cmd>Telescope lsp_type_definitions<CR>",
			vim.tbl_extend("force", opts, { desc = "Show LSP type definitions" })
		)
		vim.keymap.set(
			{ "n", "v" },
			"<leader>ca",
			vim.lsp.buf.code_action,
			vim.tbl_extend("force", opts, { desc = "See available code actions" })
		)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Smart rename" }))
		vim.keymap.set(
			"n",
			"<leader>D",
			"<cmd>Telescope diagnostics bufnr=0<CR>",
			vim.tbl_extend("force", opts, { desc = "Show buffer diagnostics" })
		)
		vim.keymap.set(
			"n",
			"<leader>d",
			vim.diagnostic.open_float,
			vim.tbl_extend("force", opts, { desc = "Show line diagnostics" })
		)
		vim.keymap.set(
			"n",
			"[d",
			vim.diagnostic.goto_prev,
			vim.tbl_extend("force", opts, { desc = "Go to previous diagnostic" })
		)
		vim.keymap.set(
			"n",
			"]d",
			vim.diagnostic.goto_next,
			vim.tbl_extend("force", opts, { desc = "Go to next diagnostic" })
		)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Show documentation" }))
		vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", vim.tbl_extend("force", opts, { desc = "Restart LSP" }))
	end,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("ts_ls", { capabilities = capabilities })
vim.lsp.config("solargraph", { capabilities = capabilities })
vim.lsp.config("html", { capabilities = capabilities })
vim.lsp.config("lua_ls", { capabilities = capabilities })

vim.lsp.enable({ "ts_ls", "solargraph", "html", "lua_ls" })
