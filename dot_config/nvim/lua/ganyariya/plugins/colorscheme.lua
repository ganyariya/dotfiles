return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1001,
  config = function()
    -- rose-pine-moon を colorscheme にする
    -- vim.cmd で `:` の内容を実行できる
    vim.cmd[[colorscheme rose-pine-moon]]
  end,
}
