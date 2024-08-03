return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refr to the configuration section below
  },
  keys = {
    {
      "<Leader>?",
      function()
        local wk = require("which-key")
        wk.show({ global = true })
      end,
      desc = "Global Keymaps (which-key)",
    },
    {
      "<Leader>?l",
      function()
        local wk = require("which-key")
        wk.show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<Leader>f", group = "Telescope" },
      { "<Leader>w", group = "Window" },
      { "<Leader>t", group = "Tab" },
      { "<Leader>b", group = "Buffer" },
      { "<Leader>c", group = "Comment" },
      { "<Leader>e", group = "Tree" },
      { "<Leader>g", group = "Git" },
      { "<Leader>l", group = "LSP" },
      { "<Leader>x", group = "Trouble" },
      { "<Leader>F", group = "Format" },
      { "<Leader>/", group = "Toggle Comment" },
    })
  end,
}
