-- 使用 pcall 保护加载，防止加载出错导致整个配置崩溃
pcall(function()
  -- 加载基础的语法配置文件（路径由 vim.g.base46_cache 指定）
  dofile(vim.g.base46_cache .. "syntax")
  -- 加载 treesitter 配置文件
  dofile(vim.g.base46_cache .. "treesitter")
end)

return {
  -- 指定 Treesitter 需要安装的解析器列表
  -- 这里包括 Lua 语言、luadoc（Lua文档注释）、printf（格式化字符串）、vim 脚本及其文档
  ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc" },

  -- 代码高亮相关配置
  highlight = {
    -- 启用 Treesitter 代码高亮
    enable = true,
    -- 使用新的语言树 (language tree) 机制，这能更准确地处理多语言嵌套情况
    use_languagetree = true,
  },

  -- 缩进相关配置
  indent = {
    -- 启用 Treesitter 的智能缩进功能
    enable = true,
  },
}
