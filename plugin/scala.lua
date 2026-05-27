vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/scalameta/nvim-metals" },
})

require("fidget").setup({})

-- opts = function() → just a regular function that returns metals_config
local metals_config = require("metals").bare_config()

metals_config.settings = {
	showImplicitArguments = true,
	excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

metals_config.init_options.statusBarProvider = "off"
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

metals_config.on_attach = function(client, bufnr)
	require("metals").setup_dap()

	local map = vim.keymap.set
	map("n", "gD", vim.lsp.buf.definition)
	map("n", "K", vim.lsp.buf.hover)
	map("n", "gi", vim.lsp.buf.implementation)
	map("n", "gr", vim.lsp.buf.references)
	map("n", "gds", vim.lsp.buf.document_symbol)
	map("n", "gws", vim.lsp.buf.workspace_symbol)
	map("n", "<leader>cl", vim.lsp.codelens.run)
	map("n", "<leader>sh", vim.lsp.buf.signature_help)
	map("n", "<leader>rn", vim.lsp.buf.rename)
	map("n", "<leader>f", vim.lsp.buf.format)
	map("n", "<leader>ca", vim.lsp.buf.code_action)
	map("n", "<leader>mc", require("telescope").extensions.metals.commands)
	map("n", "<leader>ws", function()
		require("metals").hover_worksheet()
	end)
	map("n", "<leader>aa", vim.diagnostic.setqflist)
	map("n", "<leader>ae", function()
		vim.diagnostic.setqflist({ severity = "E" })
	end)
	map("n", "<leader>aw", function()
		vim.diagnostic.setqflist({ severity = "W" })
	end)
	map("n", "<leader>d", vim.diagnostic.setloclist)
	map("n", "[c", function()
		vim.diagnostic.goto_prev({ wrap = false })
	end)
	map("n", "]c", function()
		vim.diagnostic.goto_next({ wrap = false })
	end)
end

-- config = function(self, metals_config) where self.ft was the ft list
-- → just hardcode the pattern directly
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "scala", "sbt" },
	callback = function()
		require("metals").initialize_or_attach(metals_config)
	end,
	group = nvim_metals_group,
})
