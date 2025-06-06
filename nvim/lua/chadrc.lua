-- 此文件需遵循 NvChad 的 `nvconfig.lua` 相同结构：
-- 参考：https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

-- ========================================
-- 🎨 base46 配置（主题 + 高亮样式）
-- ========================================
M.base46 = {
  -- 使用的主题名称，需在 base46/themes/ 中存在
  theme = "glow_dark",

  -- 自定义高亮组（highlight group）覆盖
  hl_override = {
    --常规界面背景类
    Normal = { bg = "NONE" }, -- Neovim 主窗口的默认背景（最常见的界面区域）
    NormalFloat = { bg = "NONE" }, --所有浮动窗口（如 Telescope、LSP 提示等）的背景
    Folded = { bg = "NONE" }, --折叠文本区域的背景
    -- CursorLine = { bg = "NONE" },--当前光标所在的整行的背景高亮（被注释掉）

    -- NvimTree 文件树相关
    NvimTreeNormal = { bg = "NONE" }, --文件树窗口的背景
    NvimTreeNormalNC = { bg = "NONE" }, --文件树在非当前窗口下的背景
    -- NvimTreeCursorLine = { bg = "NONE" },--文件树中当前选中的那一行的背景（默认会有高亮）

    -- Telescope 模糊查找相关
    TelescopeNormal = { bg = "NONE" }, --Telescope 主体窗口的背景
    TelescopePrompt = { bg = "NONE" }, --输入框部分的背景
    TelescopeResults = { bg = "NONE" }, --搜索结果区域的背景
    TelescopePromptNormal = { bg = "NONE" }, --输入框区域中内容部分的背景
    TelescopePromptPrefix = { bg = "NONE" }, --输入框前缀（如 ）的背景

    -- 补全菜单相关（通常是 nvim-cmp）
    Pmenu = { bg = "NONE" }, --补全菜单（Popup Menu）的背景
    CmpPmenu = { bg = "NONE" }, --nvim-cmp 的补全菜单背景（有些主题或插件使用）
    CmpDoc = { bg = "NONE" }, --补全文档窗口（即右侧详情）的背景
    BlinkCmpMenu = { bg = "NONE" }, --自定义/主题中的补全菜单样式（用于 blink.nvim 或相似插件）
    BlinkCmpDoc = { bg = "NONE" }, --自定义补全文档区域的背景
    BlinkCmpSignatureHelp = { bg = "NONE" }, --补全中函数签名提示的背景区域

    --窗口标题栏相关
    WinBar = { bg = "NONE" }, --当前窗口顶部标题栏背景（如 set winbar=%f）
    WinBarNC = { bg = "NONE" }, --非当前窗口的 winbar 背景

    -- 注释高亮（斜体）
    Comment = { italic = true }, --普通注释文本，设置为斜体
    ["@comment"] = { italic = true }, -- Treesitter 支持的注释类型
  },
}

return M
