return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { "<leader>ws", "<cmd>AutoSession save<CR>", desc = "Save Session" },
    { "<leader>wr", "<cmd>AutoSession restore<CR>", desc = "Restore Session" },
  },
  opts = {
    auto_restore = false,
    auto_restore_last_session = false,
    suppressed_dirs = { "~/", "~/Projects", "/", "~/Downloads", "~/Desktop", "~/Documents", "~/Pictures"},
  },
}
