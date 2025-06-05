require "nvchad.options"

vim.o.relativenumber = true
vim.api.nvim_set_hl(0, "LineNr", { fg = "#111111", bold = false })        -- 相对行号
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bold = true })  -- 当前行号

vim.o.cursorlineopt ='both'
-- vim.cmd("highlight Normal guibg=NONE")
vim.api.nvim_set_hl(0,"Normal",{bg = "NONE"})
vim.opt.shell = "pwsh"

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
