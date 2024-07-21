return  {
    "nvim-treesitter/nvim-treesitter",
     enabled = true,
     -- nvim-treesitter コマンドがアップデートされたときに :TSUpdate を実行する
     lazy = false,
     build = ":TSUpdate",
     -- これらのイベントが発生したときに nvim-treesitter が有効化される
     event = { "BufReadPost", "BufNewFile"  },
     -- 下記コマンドが実行されたときにも読み込まれる
     cmd = { "TSUpdate", "TSInstall" },
     config = function ()
       local configs = require("nvim-treesitter.configs")

       configs.setup({
           ensure_installed = {
		"lua",
	   },
           sync_install = false,
	   auto_install = true,
           highlight = { enable = true },
           indent = { enable = true },
	   incremental_selection = { enable = true },
	   textobjects = { enable = true },
         })
     end
}
