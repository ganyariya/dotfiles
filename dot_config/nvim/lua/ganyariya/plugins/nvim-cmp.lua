return {
  "hrsh7th/nvim-cmp",
  -- Insert を押したらプラグインが Load される
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- バッファ内のテキストを補完として出す
    "hrsh7th/cmp-path", -- ファイルシステムパスを補完できるようにする
    {
      "L3MON4D3/LuaSnip", -- スニペットエンジン
      version = "v2.*",
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- LuaSnip エンジンと cmp をつなぎこむ
    "rafamadriz/friendly-snippets", -- 便利なスニペット集が定義されている
    "onsails/lspkind.nvim", -- VSCode のようなアイコンを出せるようにする
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- vscode スタイルのスニペットを登録する (friendly-snippets の内容を登録している)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- スニペットについて luasnip を呼び出す
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        --['<Tab>'] = cmp.mapping.select_next_item(),
        --['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}
