return  {
    "nvim-treesitter/nvim-treesitter",
     -- nvim-treesitter コマンドがアップデートされたときに :TSUpdate を実行する
     build = ":TSUpdate",
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
         })
     end
}
