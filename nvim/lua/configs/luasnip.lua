-- 从 VSCode 代码片段格式中加载代码片段，使用懒加载
-- exclude 参数可以指定排除哪些代码片段目录，默认从全局变量 vim.g.vscode_snippets_exclude 获取
require("luasnip.loaders.from_vscode").lazy_load { exclude = vim.g.vscode_snippets_exclude or {} }

-- 也可以指定具体的 VSCode 代码片段路径，默认从全局变量 vim.g.vscode_snippets_path 获取
require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.vscode_snippets_path or "" }

-- 从 SnipMate 代码片段格式加载片段，立即加载
require("luasnip.loaders.from_snipmate").load()

-- 同时也支持懒加载指定路径下的 SnipMate 格式代码片段，路径默认从全局变量 vim.g.snipmate_snippets_path 获取
require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }

-- 从纯 Lua 格式代码片段加载片段，立即加载
require("luasnip.loaders.from_lua").load()

-- 同时支持懒加载指定路径下的 Lua 格式代码片段，路径默认从全局变量 vim.g.lua_snippets_path 获取
require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }

-- 创建一个自动命令，在离开插入模式时触发
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    -- 判断当前缓冲区是否有 LuaSnip 的活动节点，并且跳转状态未激活时
    if
      require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require("luasnip").session.jump_active
    then
      -- 取消当前片段的关联，防止残留状态影响后续编辑
      require("luasnip").unlink_current()
    end
  end,
})
