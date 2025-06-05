-- 指定 base46 主题系统的缓存路径，后面加载颜色、状态栏配置会用到
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
-- 设置 <leader> 键为 空格键（这是现代配置的常见选择）
vim.g.mapleader = " "

-- 自动安装 Lazy.nvim，并添加到 runtimepath
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

-- 读取 Lazy 配置,（位于 lua/configs/lazy.lua）
local lazy_config = require "configs.lazy"

-- 注册插件表
-- NvChad 自身被当作“插件”加载，并导入其内置插件定义（路径 nvchad.plugins）。
-- import = "plugins" 表示加载你的自定义插件模块（路径通常为 lua/plugins/ 或 lua/custom/plugins/，取决于你如何组织配置）。
-- 第二个参数为前面加载的 lazy_config 表，作为全局设置
-- setup设置lazy管理的插件表和lazy配置表
require("lazy").setup({
  { import = "plugins" },
}, lazy_config)

-- 加载 base46 主题缓存
-- 这些是 base46 主题系统的缓存文件，包含了颜色定义与状态栏样式等内容
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- 加载通用设置模块
require "options"
require "autocmds"

-- 延迟加载按键绑定
-- 使用 vim.schedule() 目的是等 Neovim 启动完成后再注册快捷键，避免插件尚未初始化导致映射失效
vim.schedule(function()
  require "mappings"
end)
