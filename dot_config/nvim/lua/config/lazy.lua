-------------------------------------------- 
-- lazy.nvim を起動する (clone + 利用可能にする）
-------------------------------------------- 
-- lazy.nvim のインストールパスを決定する
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- lazy.nvim がないのであれば clone する
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
-- lazy.nvim を NeoVim から利用できるようにする
vim.opt.rtp:prepend(lazypath)

-------------------------------------------- 
-- lazy.nvim を起動する前に mapleader の設定をする
-------------------------------------------- 
-- <Leader> を " " にする
vim.g.mapleader = " "
-- <LocalLeader> を "\\" にする
-- 特定のファイルタイプやプラグイン用のマッピングとして利用する
vim.g.maplocalleader = "\\"

-------------------------------------------- 
-- lazy.nvim を実際にセットアップする
-------------------------------------------- 
require("lazy").setup({
  spec = {
    -- plugins というディレクトリを読み込む（ganyariya がプラグインを追加できるように）
    { import = "plugins" },
    -- 再帰的にしたい場合は以下のようにする (plugins/mason/x.lua のようにする)
    -- { import = "plugins.mason", },
  },
  -- colorscheme を自由に選択できる
  install = { colorscheme = { "tokyonight" } },
  -- プラグインの更新を勝手にやってくれる
  checker = { enabled = true },
})
