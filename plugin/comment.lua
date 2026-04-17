vim.pack.add({
	{ src = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring" },
	{ src = "https://github.com/numToStr/Comment.nvim" },
})

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
	once = true,
	callback = function()
		local comment = require("Comment")
		local context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
		comment.setup({
			pre_hook = context_commentstring.create_pre_hook(),
		})
	end,
})
