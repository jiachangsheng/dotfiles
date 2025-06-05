require "nvchad.options"

vim.o.relativenumber = true
vim.o.number = true

-- 修改行号的颜色与粗细,LineNr 是普通行号，CursorLineNr 是当前行号
vim.api.nvim_set_hl(0, "LineNr", { fg = "#111111", bold = false })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bold = true })

-- 高亮光标所在的整行和行号
vim.o.cursorlineopt = "both"

-- vim.cmd("highlight Normal guibg=NONE")
-- 配合终端透明设置，可让 Neovim 背景为透明
-- vim.api.nvim_set_hl(0,"Normal",{bg = "NONE"})

-- 适用于 Windows 上使用 PowerShell 作为终端,需要确保 pwsh 在你的 PATH 中
vim.opt.shell = "pwsh"

-- 复制（yank）高亮提示
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
