vim.cmd("let g:netrw_liststyle = 3")

-- tab & indentation
vim.cmd("set expandtab") -- expand tabs to spaces
vim.cmd("set tabstop=2") -- 2 spaces per tab
vim.cmd("set softtabstop=2") -- 2 spaces per tab when editing
vim.cmd("set shiftwidth=2") -- 2 spaces per indentation
vim.cmd("set autoindent") -- auto indent new lines

vim.cmd("set nowrap") -- don't wrap lines

-- appearance
vim.cmd("set termguicolors") -- enable 24-bit RGB colors

-- clipboard
vim.cmd("set clipboard+=unnamedplus") -- use system clipboard

-- split windows
vim.cmd("set splitright") -- vertical splits to the right
vim.cmd("set splitbelow") -- horizontal splits to the bottom

vim.diagnostic.config({
	virtual_text = true, -- Показывать текст диагностики рядом со строкой
	signs = true, -- Показывать значки в левой колонке
	underline = true, -- Подчеркивать проблемные места
	update_in_insert = false, -- Не обновлять диагностику в режиме вставки
	severity_sort = true, -- Сортировать по серьезности
	float = {
		source = "always", -- Всегда показывать источник ошибки
		border = "rounded", -- Скругленные рамки окна
		header = "",
		prefix = "",
	},
})

vim.wo.number = true
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.g.mapleader = " "

local keymap = vim.keymap -- for convenience

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk"})

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights"})

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- copy to system clipboard
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+yy')

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize window sizes" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
