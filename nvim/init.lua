-- ========================================
-- 🌐 全局设置（Global Variables）
-- ========================================

-- 设置 <leader> 键为空格键（现代 Neovim 插件的推荐习惯）
vim.g.mapleader = " "

-- 设置 base46 缓存路径（用于主题、状态栏等 UI 组件）
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"

-- ========================================
-- 🔌 自动安装 Lazy.nvim 插件管理器
-- ========================================

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- 如果 Lazy.nvim 未安装，则自动 clone 到本地路径
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

-- 插入到 runtimepath 中
vim.opt.rtp:prepend(lazypath)

-- ========================================
-- 🧩 加载插件配置（lazy.nvim）
-- ========================================

-- 加载自定义 lazy.nvim 配置（例如 UI、性能、默认加载行为等）
local lazy_config = require "configs.lazy"

-- 注册插件模块
require("lazy").setup({
  -- 自定义插件模块，位于 lua/plugins/
  { import = "plugins" },
}, lazy_config)

-- ========================================
-- 🎨 加载 base46 缓存（颜色主题 + 状态栏）
-- ========================================

-- 预生成的缓存文件，包含 base46 渲染后的样式配置
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- ========================================
-- ⚙️ 加载核心配置模块（Options / Autocmds / Mappings）
-- ========================================

-- 通用 Neovim 设置，如缩进、行号、编码等
require "options"

-- 自动命令（如保存触发格式化、高亮等）
require "autocmds"

-- 延迟注册快捷键映射，避免插件尚未初始化时冲突
vim.schedule(function()
  require "mappings"
end)
