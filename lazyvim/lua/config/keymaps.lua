-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--------------------------------------------------------------------------------
-- 插入模式下的光标移动快捷键
--------------------------------------------------------------------------------
-- vim.keymap.set("i", "<C-b>", "<ESC>^i", { desc = "移动到行首" })
-- vim.keymap.set("i", "<C-e>", "<End>", { desc = "移动到行尾" })
-- vim.keymap.set("i", "<C-h>", "<Left>", { desc = "左移" })
-- vim.keymap.set("i", "<C-l>", "<Right>", { desc = "右移" })
-- vim.keymap.set("i", "<C-j>", "<Down>", { desc = "下移" })
-- vim.keymap.set("i", "<C-k>", "<Up>", { desc = "上移" })
vim.keymap.set("i", "jk", "<ESC>", { desc = "快速退出插入模式" })

--------------------------------------------------------------------------------
-- 基本编辑功能
--------------------------------------------------------------------------------
-- vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "清除高亮" })
-- vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "保存文件" })
vim.keymap.set("n", "<C-c>", "<cmd>%y+<CR>", { desc = "复制整篇文件内容" })
vim.keymap.set("n", "<C-x>", function()
  vim.cmd("%y+") -- 复制整篇内容到系统剪贴板
  vim.cmd(":%delete") -- 删除整篇内容
end, { desc = "剪切整篇文件内容" })

--------------------------------------------------------------------------------
-- 命令模式快速进入
--------------------------------------------------------------------------------
-- vim.keymap.set("n", ";", ":", { desc = "命令行模式" })
