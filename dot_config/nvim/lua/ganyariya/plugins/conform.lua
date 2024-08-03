return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    local formatOnSaveConfig = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    }

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
      },
      format_on_save = formatOnSaveConfig,
    })

    local keymap = vim.keymap
    keymap.set({ "n", "v" }, "<Leader>F", function()
      conform.format(formatOnSaveConfig)
    end, { desc = "Format" })
  end,
}
