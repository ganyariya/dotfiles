return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
  },
  enabled = true,
  config = function()
    require("mason-nvim-dap").setup({
      ensure_installed = {
        "php",
        "php-debug-adapter",
        "delve",
      },
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    })
  end,
}
