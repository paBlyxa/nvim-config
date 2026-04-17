vim.pack.add({
  { src = 'https://github.com/folke/which-key.nvim' },
})

vim.o.timeout = true
vim.o.timeoutlen = 500

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    require("which-key").setup({})
  end,
})

vim.keymap.set("n", "<leader>?", function()
  require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })
