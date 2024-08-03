return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      -- javascript = { "eslint_d" },
      -- typescript = { "eslint_d" },
    }

    -- lint という自動コマンド「グループ」を作成する
    -- lint_augroup は `lint` グループを参照する整数の ID (この ID をもとに色々 neovim 関数で操作できる)
    -- neovim 内部では `lint` という文字列グループで管理されている
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    -- 自動コマンドを作成して、 lint_augroup グループに自動コマンドを登録する
    --
    -- callback の関数を lint_augroup (lint グループ) に nvim_create_autocmd のタイミングで登録する
    -- BufEnter, ... の各種イベントが実行されたら callback 関数が実行される
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        -- require('lint') を実行する
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<Leader>L", function()
      lint.try_lint()
    end, { desc = "Lint" })
  end,
}
