local opt = vim.opt

-- 行番号
opt.relativenumber = true
opt.number = true

-- tab & indent
opt.tabstop = 2 -- タブ文字の幅を 2 文字にする
opt.shiftwidth = 2 -- インデントのときに挿入するスペース
opt.expandtab = true -- タブ入力したときに space に置き換える
opt.autoindent = true

-- search 
opt.ignorecase = true -- 検索時に大文字小文字を無視する
opt.smartcase = true -- 検索に大文字を入力した場合は大文字を考慮する

-- clipboard
opt.clipboard:append("unnamedplus")

-- cursor line
opt.cursorline = true

-- color
opt.termguicolors = true -- 24 bit true-color
opt.background = "dark" -- dark mode color
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- インデント,末尾,開始位置で削除が行える（直感的）

-- split windows
opt.splitright = true -- 右に分割する
opt.splitbelow = true -- 下に分割する

-- turn off swapfile
opt.swapfile = false
