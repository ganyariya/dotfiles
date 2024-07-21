return {
    "shaunsingh/nord.nvim",
    enabled = true,
    lazy = false,
    priority = 1001,
    config = function()
      vim.cmd([[colorscheme nord]])
    end,
}
