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
  virtual_text = true,     -- Показывать текст диагностики рядом со строкой
  signs = true,            -- Показывать значки в левой колонке
  underline = true,        -- Подчеркивать проблемные места
  update_in_insert = false, -- Не обновлять диагностику в режиме вставки
  severity_sort = true,    -- Сортировать по серьезности
  float = {
    source = "always",     -- Всегда показывать источник ошибки
    border = "rounded",    -- Скругленные рамки окна
    header = "",
    prefix = "",
  },
})

vim.wo.number = true

vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+yy')
