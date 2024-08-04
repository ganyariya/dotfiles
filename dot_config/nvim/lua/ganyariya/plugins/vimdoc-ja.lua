return {
  "vim-jp/vimdoc-ja",
  lazy = true,
  -- command line モードで `h` が実行されたときだけこのプラグインを呼び出す
  keys = {
    { "h", mode = "c" },
  },
}
