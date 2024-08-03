return {
  {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    opts = {},
    keys = {
      { "<leader>gly", "<Cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
      { "<leader>glY", "<Cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
    },
  },
}
