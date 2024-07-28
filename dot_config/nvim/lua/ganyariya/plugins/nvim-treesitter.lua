return  {
    "nvim-treesitter/nvim-treesitter",
     enabled = true,
     build = ":TSUpdate",
     config = function ()
       local configs = require("nvim-treesitter.configs")

       configs.setup({
         ensure_installed = {
          "lua",
         },
         sync_install = false,
         auto_install = true,
         highlight = { enable = true },
         indent = { enable = true },
         incremental_selection = { enable = true },
         textobjects = { enable = true },
       })
     end,
}
