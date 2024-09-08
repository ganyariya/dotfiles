return {
  "sudormrfbin/cheatsheet.nvim",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
  },
  config = function()
    local cheatsheet = require("cheatsheet")
    cheatsheet.setup({
      bundled_cheatsheets = {
        enabled = {
          "default",
          "regex",
        },
      },
      bundled_plugin_cheatsheets = {
        enabled = {
          "gitsigns.nvim",
        },
      },
    })
  end,
}
