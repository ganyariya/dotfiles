return {
  "rose-pine/neovim",
  name = "rose-pine",
  enabled = true,
  priority = 1001,
  config = function()
    -- rose-pine-moon を colorscheme にする
    -- vim.cmd で `:` の内容を実行できる
    vim.cmd[[colorscheme rose-pine-moon]]
    --vim.cmd[[colorscheme rose-pine-dawn]]
  end,
}
