return   { 'shaunsingh/nord.nvim',
    lazy = false,
    -- 優先度をあげて 最初に color palette が設定されるようにする
    priority = 1000,
    config = function()
      -- nord を colorscheme にする
      -- vim.cmd で `:` の内容を実行できる
      vim.cmd[[colorscheme nord]]
    end,
  }
