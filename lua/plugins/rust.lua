return {
  {
    'mrcjkb/rustaceanvim',
    version = '^6',
    lazy = false,
    config = function()
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
    end,
  },
  {
    'rust-lang/rust.vim',
    ft = 'rust',
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    'saecki/crates.nvim',
    ft = { 'toml' },
    config = function()
      require('crates').setup {
        completion = {
          cmp = {
            enabled = true,
          },
        },
      }
      require('cmp').setup.buffer {
        sources = {
          { name = 'nvim_lsp' },
          { name = 'crates' },
          { name = 'luasnip' },
          { name = 'buffer' },
        },
      }
    end,
  },
}
