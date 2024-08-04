return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    -- y,d を押した後に `R` を押すことで treesitter_search がおこなえる
    -- そこで指定したラベルまでを削除できる
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- `/` による検索時に <C-k> を押すと flash jump  toggle できる
    { "<C-k>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash When Search" },
  },
}
