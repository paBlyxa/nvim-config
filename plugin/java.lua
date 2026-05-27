vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-jdtls" },
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		vim.bo.expandtab = true
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
		vim.bo.softtabstop = 4

		local config = {
			cmd = { vim.fn.expand("$MASON/bin/jdtls") },
			root_dir = vim.fs.dirname(
				vim.fs.find({ "gradlew", "mvnw", ".git", "pom.xml", "build.gradle" }, { upward = true })[1]
			),
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		}
		require("jdtls").start_or_attach(config)
	end,
})
