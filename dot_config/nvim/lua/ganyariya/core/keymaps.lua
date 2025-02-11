local keymap = vim.keymap

local opts = function(desc)
	return { noremap = true, silent = true, desc = desc }
end

vim.g.mapleader = " "

-- 削除したときに yank register に保存しないようにする
keymap.set({ "n", "v" }, "x", '"_x', { noremap = true, silent = true })
-- keymap.set({ "n", "v" }, "d", '"_d', { noremap = true, silent = true })

----------------------------
-- Knife
----------------------------
keymap.set("n", "<leader>kY", "ggVGy", { noremap = true, silent = true, desc = "Yank buffer all" })
keymap.set("n", "<leader>k/", "<Cmd>noh<CR>", { noremap = true, silent = true, desc = "Clean highlight" })

----------------------------
-- Windows
----------------------------
--shift を押しながらで分割する
keymap.set("n", "<Leader>w-", ":split<CR>", opts("Split window horizontally"))
keymap.set("n", "<Leader>w|", ":vsplit<CR>", opts("Split window vertically"))

keymap.set("n", "<Leader>wh", "<C-w>h", opts("Move to left window"))
keymap.set("n", "<Leader>wj", "<C-w>j", opts("Move to bottom window"))
keymap.set("n", "<Leader>wk", "<C-w>k", opts("Move to top window"))
keymap.set("n", "<Leader>wl", "<C-w>l", opts("Move to right window"))

keymap.set("n", "<Leader>w<", "20<C-w><", opts("Decrease window width"))
keymap.set("n", "<Leader>w>", "20<C-w>>", opts("Increase window width"))
keymap.set("n", "<Leader>w>>", "20<C-w>+", opts("Increase window height"))
keymap.set("n", "<Leader>w<<", "20<C-w>-", opts("Decrease window height"))

keymap.set("n", "<Leader>wo", ":only<CR>", opts("Close all other windows"))
keymap.set("n", "<Leader>wc", ":close<CR>", opts("Close current window"))

----------------------------
-- Tabs
----------------------------
keymap.set("n", "<Leader>tn", "<Cmd>tabnew<CR>", opts("Open new tab"))
keymap.set("n", "<Leader>tc", "<Cmd>tabclose<CR>", opts("Close current tab"))

keymap.set("n", "<Leader>tn", "<Cmd>tabnext<CR>", opts("Go to next tab"))
keymap.set("n", "<Leader>tp", "<Cmd>tabprevious<CR>", opts("Go to previous tab"))
keymap.set("n", "<Leader>tF", "<Cmd>tabfirst<CR>", opts("Go to first tab"))
keymap.set("n", "<Leader>tL", "<Cmd>tablast<CR>", opts("Go to last tab"))

keymap.set("n", "<Leader>to", "<Cmd>tabonly<CR>", opts("Close all tabs except current"))
keymap.set("n", "<Leader>tf", "<Cmd>tabnew %<CR>", opts("Open current buffer in new tab"))

----------------------------
-- Buffers
----------------------------
keymap.set("n", "<Leader>bl", "<Cmd>buffers<CR>", opts("List all buffers"))

keymap.set("n", "<Leader>bn", "<Cmd>bnext<CR>", opts("Go to next buffer"))
keymap.set("n", "<Leader>bp", "<Cmd>bprevious<CR>", opts("Go to previous buffer"))
keymap.set("n", "<Leader>bF", "<Cmd>bfirst<CR>", opts("Go to first buffer"))
keymap.set("n", "<Leader>bL", "<Cmd>blast<CR>", opts("Go to last buffer"))

keymap.set("n", "<Leader>bd", "<Cmd>bdelete<CR>", opts("Delete current buffer"))
keymap.set("n", "<Leader>bD", "<Cmd>bdelete!<CR>", opts("Force delete current buffer"))

keymap.set("n", "<Leader>bo", "<Cmd>%bdelete|e#|bdelete#<CR>", opts("Delete all buffers except current"))
keymap.set("n", "<Leader>bw", "<Cmd>wall<CR>", opts("Save all modified buffers"))

keymap.set("n", "<Leader>b`", "<Cmd>b#<CR>", opts("Go to last buffer"))

----------------------------
-- Scroll Cycle
----------------------------
local scroll_state = 1
keymap.set("n", "zz", function()
	if scroll_state == 1 then
		vim.cmd("normal! zz")
		scroll_state = 2
	elseif scroll_state == 2 then
		vim.cmd("normal! zt")
		scroll_state = 3
	elseif scroll_state == 3 then
		vim.cmd("normal! zb")
		scroll_state = 1
	end
end, { noremap = true, silent = true, desc = "Cycle scroll position (center/top/bottom)" })
