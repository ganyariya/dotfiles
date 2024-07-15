
return {
     "williamboman/mason.nvim",
     -- mason.nvim が読み込まれたあとに config 関数が実行される
     -- "williamboman/mason.nvim" だけだと install だけ行われて、そこから機能は実行されない
     -- mason.nvim の場合は setup 関数を呼び出すことで、コマンドの登録や内部状態の初期化が行われる
     config = function() 
        -- mason を初期化する
	require("mason").setup()
     end
}
