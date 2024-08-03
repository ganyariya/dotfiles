return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
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
    local icon = require("which-key.icons")

    wk.add({
      { "<Leader>f", group = "Telescope" },
      { "<Leader>w", group = "Window" },
      { "<Leader>t", group = "Tab" },
      { "<Leader>b", group = "Buffer" },
      { "<Leader>c", group = "Comment", icon = "#" },
      { "<Leader>e", group = "Tree", icon = "🌲" },
      { "<Leader>g", group = "Git" },
      { "<Leader>l", group = "LSP", icon = "💉" },
      { "<Leader>x", group = "Trouble", icon = "⚠" },
      { "<Leader>L", group = "Lint", icon = icon.get_icon("checkhealth") },
      { "<Leader>F", group = "Format", icon = "🌊" },
      { "<Leader>/", group = "Toggle Comment" },
      -- lsp
      { "<Leader>lg", group = "Goto" },
      -- git link
      { "<Leader>gl", group = "GitLink" },
    })
  end,
}
