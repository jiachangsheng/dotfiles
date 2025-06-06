-- 快捷键映射设置（map = vim.keymap.set）
local map = vim.keymap.set

--------------------------------------------------------------------------------
-- 插入模式下的光标移动快捷键
--------------------------------------------------------------------------------
map("i", "<C-b>", "<ESC>^i", { desc = "移动到行首" })
map("i", "<C-e>", "<End>", { desc = "移动到行尾" })
map("i", "<C-h>", "<Left>", { desc = "左移" })
map("i", "<C-l>", "<Right>", { desc = "右移" })
map("i", "<C-j>", "<Down>", { desc = "下移" })
map("i", "<C-k>", "<Up>", { desc = "上移" })
map("i", "jk", "<ESC>", { desc = "快速退出插入模式" })

--------------------------------------------------------------------------------
-- 窗口操作
--------------------------------------------------------------------------------
map("n", "<C-h>", "<C-w>h", { desc = "切换到左侧窗口" })
map("n", "<C-l>", "<C-w>l", { desc = "切换到右侧窗口" })
map("n", "<C-j>", "<C-w>j", { desc = "切换到下方窗口" })
map("n", "<C-k>", "<C-w>k", { desc = "切换到上方窗口" })

--------------------------------------------------------------------------------
-- 基本编辑功能
--------------------------------------------------------------------------------
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "清除高亮" })
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "保存文件" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "复制整篇文件内容" })
map("n", "<C-x>", function()
  vim.cmd "%y+" -- 复制整篇内容到系统剪贴板
  vim.cmd ":%delete" -- 删除整篇内容
end, { desc = "剪切整篇文件内容" })

--------------------------------------------------------------------------------
-- 行号切换
--------------------------------------------------------------------------------
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "切换显示行号" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "切换相对行号" })

--------------------------------------------------------------------------------

-- NvChad 主题切换
map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "切换 NvChad 主题" })

--------------------------------------------------------------------------------
-- 缓冲区 (buffer) 操作
--------------------------------------------------------------------------------
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "新建缓冲区" })
map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "下一个缓冲区" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "上一个缓冲区" })

map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "关闭当前缓冲区" })

--------------------------------------------------------------------------------
-- 注释插件快捷键 (Comment.nvim)
--------------------------------------------------------------------------------
map("n", "<leader>/", "gcc", { desc = "切换注释", remap = true })
map("v", "<leader>/", "gc", { desc = "切换注释", remap = true })

--------------------------------------------------------------------------------
-- 文件树（NvimTree）
--------------------------------------------------------------------------------
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "切换文件树窗口" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "聚焦文件树窗口" })

--------------------------------------------------------------------------------
-- Telescope 搜索功能
--------------------------------------------------------------------------------
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "搜索文件" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "搜索所有文件" }
)
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "全局文本搜索" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "搜索打开的缓冲区" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "搜索帮助文档" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "搜索书签" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "打开最近文件" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "搜索当前缓冲区" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "查看 Git 提交历史" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "查看 Git 状态" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "选择隐藏终端" })

--------------------------------------------------------------------------------
-- LSP 与格式化
--------------------------------------------------------------------------------
map({ "n", "x" }, "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "格式化代码" })

map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "打开诊断信息列表" })

--------------------------------------------------------------------------------
-- 内置终端（NvChad）
--------------------------------------------------------------------------------
-- 退出终端插入模式
-- map("t", "<C-x>", "<C-\\><C-N>", { desc = "退出终端模式" })

-- 新建终端
map("n", "<leader>h", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "新建水平终端" })

map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "新建垂直终端" })

-- 切换可显示/隐藏的终端
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "切换垂直终端" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "切换水平终端" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "切换浮动终端" })

--------------------------------------------------------------------------------
-- WhichKey 快捷键提示
--------------------------------------------------------------------------------
map("n", "<leader>wK", "<cmd>WhichKey<CR>", { desc = "查看所有快捷键" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "查询某个快捷键" })

--------------------------------------------------------------------------------
-- 命令模式快速进入
--------------------------------------------------------------------------------
map("n", ";", ":", { desc = "命令行模式" })
