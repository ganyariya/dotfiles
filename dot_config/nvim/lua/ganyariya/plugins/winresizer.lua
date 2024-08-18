vim.g.winresizer_start_key = "<Leader>wr"

return {
  "simeji/winresizer",
  config = function()
    vim.g.winresizer_vert_resize = 10
    vim.g.winresizer_horiz_resize = 5

    local keymap = vim.keymap
    keymap.set("n", "<Leader>wr", ":WinResizerStartResize<CR>", { noremap = true, silent = true })
  end,
}
