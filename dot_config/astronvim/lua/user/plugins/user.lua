-- TODO Test
-- TODO
--
return {
	-- You can also add new plugins here as well:
	-- Add plugins, the lazy syntax

	-- https://www.youtube.com/watch?v=GEHPiZ10gOk
	-- {
	-- 	"folke/todo-comments.nvim",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	-- config = function()
	-- 	--   require("todo-comments").setup()
	-- 	-- end,
	-- 	opts = {},
	-- 	-- trigger after opening a file
	-- 	event = "User AstroFile",
	-- 	-- File を開かなくても TodoTelescope コマンドを実行できるようにする
	-- 	cmd = { "TodoTelescope" },
	-- 	-- 特定のキー入力でコマンドを実行する
	-- 	keys = {
	-- 		{ "<leader>a", "<cmd>TodoTelescope<cr>", "TodoTelescope を実行する" },
	-- 	},
	-- },

	{
		"karb94/neoscroll.nvim",
		opts = {},
		event = "VeryLazy",
	},
}
