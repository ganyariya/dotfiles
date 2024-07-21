-- mason から nvim-lspconfig を呼び出せるようにする
return {
    "williamboman/mason-lspconfig.nvim",
    enabled = true,
    lazy = false,
    dependencies = {
      { "williamboman/mason.nvim" },
      { "neovim/nvim-lspconfig" },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require('mason-lspconfig')

      -- mason_lspconfig.setup({
--         automatic_installation = true,
 --     })

      -- 各種 lspconfig を setup する 
      --mason_lspconfig.setup_handlers({
       -- function(server_name)
	--  lspconfig[server_name].setup({})
--        end,
 --     })

      -- Lsp が有効化されたときに実行される
      -- ここで keymap を設定すれば LSP が有効なときだけ設定できる
      vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(_)
	  end
      })

      -- lsp が有効な言語でのみ実行する
     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
     vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    end
}
