return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- cmp で lsp を利用できるようにする
    "hrsh7th/cmp-nvim-lsp",
    -- file 操作で lsp を利用できるようにする
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
    { "nvimdev/lspsaga.nvim" },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local mason_lspconfig = require("mason-lspconfig")

    local keymap = vim.keymap

    -- Lsp が開始されたときに keymap を設定する
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        -- カーソルにある word の参照箇所を調べる
        opts.desc = "Show References"
        keymap.set("n", "<leader>lR", "<Cmd>Telescope lsp_references<CR>", opts)

        -- カーソルにある word の定義を調べる
        --opts.desc = "Show Definitions"
        --keymap.set("n", "<Leader>lD", "<Cmd>Telescope lsp_definitions<CR>", opts)

        -- カーソルにある word の定義を調べる
        -- edit = '<C-c>o' vsplit = "<C-c>v" split = "<C-c>i" tabe = "<C-c>t" quit = "q" close = "<C-c>k"
        -- TODO: これら keymap がきちんと動いていないので治す
        opts.desc = "Show Definitions with Saga"
        keymap.set("n", "<Leader>lD", "<Cmd>Lspsaga peek_definition<CR>", opts)

        -- カーソルにある word の実装を調べる
        opts.desc = "Show Implementations"
        keymap.set("n", "<Leader>lI", "<Cmd>Telescope lsp_implementations<CR>", opts)

        -- カーソルにある word の型定義を調べる
        opts.desc = "Show Type Definitions"
        keymap.set("n", "<Leader>lT", "<Cmd>Telescope lsp_type_definitions<CR>", opts)

        -- 該当行でできるコードアクションを出す
        -- 抜けるときは q
        opts.desc = "Code Actions"
        keymap.set({ "n", "v" }, "<leader>lA", "<Cmd>Lspsaga code_action<CR>", opts)

        -- 該当の word を rename する
        -- 抜けるときは <C-k>
        opts.desc = "Rename"
        keymap.set("n", "<Leader>lN", "<Cmd>Lspsaga rename<CR>", opts)

        -- 今開いているファイルの Diagnostics を表示する
        --[[ opts.desc = "Show Current File Diagnostics"
        keymap.set("n", "<Leader>ldC", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) ]]

        --[[ -- 今開いているファイルの Diagnostics を表示する
        opts.desc = "Show line diagnostics"
        keymap.set("n", "<Leader>ldl", vim.diagnostic.open_float, opts) -- show diagnostics for line ]]

        -- 宣言箇所に移動する
        opts.desc = "Go to Declaration"
        keymap.set("n", "<Leader>lgD", vim.lsp.buf.declaration, opts)

        -- 前の診断箇所に移動する
        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "<Leader>lgP", vim.diagnostic.goto_prev, opts)

        -- 次の診断箇所に移動する
        opts.desc = "Go to next diagnostic"
        keymap.set("n", "<Leader>lgN", vim.diagnostic.goto_next, opts)

        -- cursor 位置のドキュメントを読む
        opts.desc = "Show Documentation for what is under cursor"
        keymap.set("n", "<Leader>lK", "<Cmd>Lspsaga hover_doc<CR>", opts)
        keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)

        -- リスタートする
        opts.desc = "Restart LSP"
        keymap.set("n", "<Leader>lS", ":LspRestart<CR>", opts)
      end,
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
          capabilities = capabilities,
        })
      end,
      -- LSP ごとの設定を行う
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
              },
            },
          },
        })
      end,
      ["intelephense"] = function()
        lspconfig["intelephense"].setup({
          capabilities = capabilities,
          settings = {
            intelephense = {
              -- phpcs で怒られないように format size を設定する
              format = {
                tabSize = 4,
                insertSpaces = true,
              },
            },
          },
        })
      end,
    })
  end,
}
