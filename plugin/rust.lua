-- prevent rust.vim from overriding treesitter indentexpr
vim.g.rust_recommended_style = 0

vim.pack.add({
	{ src = "https://github.com/mrcjkb/rustaceanvim", version = vim.version.range("^6") },
	{ src = "https://github.com/rust-lang/rust.vim" },
	{ src = "https://github.com/saecki/crates.nvim" },
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "rust",
	callback = function()
		vim.bo.tabstop = 4
		vim.bo.softtabstop = 4
		vim.bo.shiftwidth = 4
	end,
})

-- rustaceanvim
local codelldb_pkg = vim.fn.expand("$MASON/packages/codelldb")
local extension_path = codelldb_pkg .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
local cfg = require("rustaceanvim.config")

vim.g.rustaceanvim = {
	server = {
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
	},
	dap = {
		adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
	},
}

-- rust.vim — ft = 'rust' → only set when editing a rust file
vim.g.rustfmt_autosave = 1

-- crates.nvim — ft = { 'toml' } → load on toml files only
vim.api.nvim_create_autocmd("FileType", {
	pattern = "toml",
	once = true,
	callback = function()
		require("crates").setup({
			completion = {
				cmp = { enabled = true },
			},
		})
		require("cmp").setup.buffer({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "crates" },
				{ name = "luasnip" },
				{ name = "buffer" },
			},
		})
	end,
})
