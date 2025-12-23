return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      -- Open terminal in insert mode
      open_mapping = [[<c-\>]],
      start_in_insert = true,
      persist_size = true,
      close_on_exit = true,
    })

    local Terminal  = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      hidden = true
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end


    -- Keymaps for easy terminal access
    vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', { desc = 'Toggle floating terminal' })
    vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', { desc = 'Toggle horizontal terminal' })
    vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', { desc = 'Toggle vertical terminal' })
    vim.keymap.set('n', '<leader>lg', '<cmd>lua _lazygit_toggle()<CR>', {noremap = true, silent = true})

    -- Terminal mode keymap to escape
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
  end,
}
