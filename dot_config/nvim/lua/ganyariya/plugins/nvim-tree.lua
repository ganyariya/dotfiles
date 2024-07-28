return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
	  local nvimtree = require('nvim-tree')

    -- neovim 自体の file browser を止める
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- nvim-tree が起動したときに設定する関数
    local function my_on_attach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      -- `?` を実行したときに help を出すようにする
      vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))

      vim.keymap.set("n", "l", api.node.open.edit,    opts("Edit Or Open"))
      vim.keymap.set("n", "h", api.tree.close,        opts("Close"))
      vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
    end

    nvimtree.setup({
      on_attach = my_on_attach,
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true
      },
    })

    -- カスタム関数

    -- キーマップ
    local keymap = vim.keymap
    local api = require('nvim-tree.api')

    keymap.set("n", "<leader>eo", api.tree.open, { desc = "Open file explorer" }) -- toggle file explorer
    keymap.set("n", "<leader>ef", api.tree.focus, { desc = "Focus file explorer" }) -- toggle file explorer
    keymap.set("n", "<leader>ee", api.tree.toggle, { desc = "Toggle file explorer" }) -- toggle file explorer
    keymap.set("n", "<leader>ec", api.tree.close, { desc = "Collapse file explorer" }) -- collapse file explorer
  end
}
