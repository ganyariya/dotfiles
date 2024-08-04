return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")
    local Terminal = require("toggleterm.terminal").Terminal
    toggleterm.setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 20
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      -- c-\ を押せば Terminal を toggle する
      -- 2 c-\ を押せば 2 番目の terminal を開ける（番号を指定できる）
      open_mapping = [[<c-\>]],
      hide_numbers = true,
    })

    -- git が有効なときにだけ動く
    local gituiTerminal = Terminal:new({
      cmd = "gitui",
      name = "gitui",
      dir = "git_dir",
      direction = "float",
      hidden = true,
    })
    function __ToggleGitUITerminal()
      gituiTerminal:toggle()
    end
    vim.api.nvim_set_keymap(
      "n",
      "<Leader>TG",
      "<cmd>lua __ToggleGitUITerminal()<CR>",
      { noremap = true, silent = true, desc = "gitui" }
    )

    local gotopTerminal = Terminal:new({
      cmd = "gotop",
      name = "gotop",
      dir = "git_dir",
      direction = "float",
      hidden = true,
    })
    function __ToggleGotopTerminal()
      gotopTerminal:toggle()
    end
    vim.api.nvim_set_keymap(
      "n",
      "<Leader>TT",
      "<cmd>lua __ToggleGotopTerminal()<CR>",
      { noremap = true, silent = true, desc = "gotop" }
    )

    -- c-\ でデフォルト terminal を出せるので defaultBottomTerminal は使わなそう
    --[[ -- default
    local defaultBottomTerminal = Terminal:new({
      name = "default",
      dir = "git_dir",
      direction = "horizontal",
    })
    function __ToggleDefaultBottomTerminal()
      defaultBottomTerminal:toggle()
    end
    vim.api.nvim_set_keymap(
      "n",
      "<Leader>TX",
      "<cmd>lua __ToggleDefaultBottomTerminal()<CR>",
      { noremap = true, silent = true, desc = "default" }
    ) ]]
  end,
}
