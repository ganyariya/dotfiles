vim.g.mapleader = " "

-- 削除したときに yank register に保存しないようにする
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'd', '"_d', { noremap = true, silent = true })
