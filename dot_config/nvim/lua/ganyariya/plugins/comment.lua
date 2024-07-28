return -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
{
    'numToStr/Comment.nvim',
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      toggler = {
        line = '<Leader>/',
        block = '<Leader>/b',
      },
      opleader = {
        line = '<Leader>c/',
        block = '<Leader>c/b',
      }
    },
}

