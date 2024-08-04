-- https://github.com/kylechui/nvim-surround
-- ## What's this
-- 「surround」だけを編集する（vim 純正の da" だを `"` ごと削除されてしまうので、 surround 以外も編集してしまう）
--
-- ## How to use
-- delete surround: ds{char}
-- change surround: cs{target}{replacement}
-- add surround: ys{motion}{char}
return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true,
}
