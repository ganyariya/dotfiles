-- lspsaga を抜けるときは <C-k>
return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  lazy = true,
  config = function()
    require("lspsaga").setup({
      definition = {
        keys = {
          edit = "<C-c>o",
          vsplit = "<C-c>v",
          quit = "q",
        },
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
