return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')

    telescope.load_extension("fzf")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
      },
    })

    local keymap = vim.keymap

    -- keymap.set("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>")
    keymap.set("n", "<Leader>f?", builtin.builtin, { desc = "Telescope Lancher"})
    -- カレントディレクトリ配下のファイル名を検索する
    keymap.set("n", "<Leader>ff", builtin.find_files, { desc = "Telescope Find Files" })
    keymap.set("n", "<Leader>fr", builtin.oldfiles, { desc = "Telescope Recent Files" })
    keymap.set("n", "<Leader>fk", builtin.keymaps, { desc = "Telescope KeyMaps" })
    keymap.set("n", "<Leader>fh", builtin.help_tags, { desc = "Telescope Help Tags" })
    keymap.set("n", "<Leader>fc", builtin.command_history, { desc = "Telescope Command Histories" })
    -- カレントディレクトリ配下のファイルテキストを grep 検索する
    keymap.set("n", "<Leader>fs", builtin.live_grep, { desc = "Telescope Grep Texts in Files" })
  end
}
