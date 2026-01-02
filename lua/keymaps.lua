vim.g.mapleader = " "

local keymap = vim.keymap -- for convenience

keymap.set("i", "jki", "<ESC>", { desc = "Exit insert mode with jk"})
