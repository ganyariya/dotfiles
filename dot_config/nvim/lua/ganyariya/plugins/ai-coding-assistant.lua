-- "zsh で指定する環境変数で github copilot を使うかを切り替える"
local is_copilot_enabled = vim.env.NEOVIM_GITHUB_COPILOT == "1"

if is_copilot_enabled then
  return {
    "github/copilot.vim",
    lazy = false,
  }
else
  return {
    "Exafunction/codeium.vim",
    event = "BufEnter",
  }
end
