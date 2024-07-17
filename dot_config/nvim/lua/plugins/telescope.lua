return {
    'nvim-telescope/telescope.nvim', 
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      -- vim.keymap.set('n', '<Leader>P', builtin.builtin, { desc = 'Telescope Lancher' })
      vim.keymap.set('n', '<Leader>tll', builtin.builtin, { desc = 'Telescope Lancher' })
    end,
}
