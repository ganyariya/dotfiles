return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  opts = {
    focus = true,
  },
  -- Trouble コマンドを実行したときに初めてプラグインがロードされる
  --cmd = "Trouble",
  keys = {
    { "<Leader>xx", "<Cmd>Trouble diagnostics toggle<CR>", desc = "Trouble workspace" },
    { "<Leader>xd", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Trouble current buffer" },
    { "<Leader>xq", "<Cmd>Trouble quickfix toggle<CR>", desc = "Trouble quicklist" },
    { "<Leader>xl", "<Cmd>Trouble loclist toggle<CR>", desc = "Trouble locationlist" },
    { "<Leader>xt", "<Cmd>Trouble todo toggle<CR>", desc = "Trouble todos" },
    { "<Leader>xw", "<Cmd>Trouble diagnostics close<CR>", desc = "Trouble todos" },
  },
}
