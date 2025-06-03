require "nvchad.options"

-- add yours here!

vim.o.relativenumber = true
vim.o.cursorlineopt ='both'
-- vim.cmd("highlight Normal guibg=NONE")
vim.api.nvim_set_hl(0,"Normal",{bg = "NONE"})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})



