return {
    "folke/tokyonight.nvim",
    -- nord 使うので こちらは無効化
    enabled = false,
    lazy = true,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
}
