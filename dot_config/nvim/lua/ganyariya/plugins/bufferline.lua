-- buffer にアイコンと名前をつける
return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  -- require('bufferline').setup(opts) と同じになる
  opts = {
    options = {
      -- mode = "tabs",
    },
  },
}
