return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- cmp で lsp を利用できるようにする
    "hrsh7th/cmp-nvim-lsp",
    -- file 操作で lsp を利用できるようにする
    { "antosha417/nvim-lsp-file-operations", config = true },
    -- { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')
    local mason_lspconfig = require('mason-lspconfig')

    local keymap = vim.keymap

    -- Lsp が開始されたときに keymap を設定する
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Show LSP References"
        keymap.set("n", "<leader>lr", "<Cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Show LSP Definitions"
        keymap.set("n", "<Leader>lD", "<Cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP Implementations"
        keymap.set("n", "<Leader>li", "<Cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP Type Definitions"
        keymap.set("n", "<Leader>ltd", "<Cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "Show Available Code Actions"
        keymap.set({ "n", "v" }, "<leader>lca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart Rename"
        keymap.set("n", "<Leader>lrn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<Leader>ldb", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<Leader>ldl", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to Declaration"
        keymap.set("n", "<Leader>lgd", vim.lsp.buf.declaration, opts)

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "<Leader>lgp", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "<Leader>lgn", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show Documentation for what is under cursor"
        keymap.set("n", "<Leader>lK", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<Leader>lrs", ":LspRestart<CR>", opts)
      end
    })

    -- エラー時のアイコンを変更する
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
        capabilities = capabilities
      })
      end,
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              }
            }
          }
        })
      end
    })

  end
}
