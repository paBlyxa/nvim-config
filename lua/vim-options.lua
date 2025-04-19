vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
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
