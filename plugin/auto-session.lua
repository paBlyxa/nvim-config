vim.pack.add({
	{ src = "https://github.com/rmagatti/auto-session" },
})

require("auto-session").setup({
	auto_restore = false,
	suppressed_dirs = { "~/", "~/Projects", "/", "~/Downloads", "~/Desktop", "~/Documents", "~/Pictures" },
})

vim.keymap.set("n", "<leader>ws", "<cmd>AutoSession save<CR>", { desc = "Save Session" })
vim.keymap.set("n", "<leader>wr", "<cmd>AutoSession restore<CR>", { desc = "Restore Session" })
