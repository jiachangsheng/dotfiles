-- 从缓存目录中加载 base46 主题中的 cmp 配色方案（用于高亮匹配项）
dofile(vim.g.base46_cache .. "cmp")

-- 加载 nvim-cmp 补全框架
local cmp = require "cmp"

-- 定义 cmp 的整体配置项
local options = {
  -- 设置补全菜单行为
  completion = {
    completeopt = "menu,menuone", -- 显示菜单，哪怕只有一个匹配项也显示
  },

  -- 配置片段引擎（用于支持 LuaSnip 展开）
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- 使用 LuaSnip 展开补全片段
    end,
  },

  -- 快捷键映射
  mapping = {
    -- 上一个补全项（Ctrl+p）
    ["<C-p>"] = cmp.mapping.select_prev_item(),

    -- 下一个补全项（Ctrl+n）
    ["<C-n>"] = cmp.mapping.select_next_item(),

    -- 向上滚动文档窗口（Ctrl+d）
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),

    -- 向下滚动文档窗口（Ctrl+f）
    ["<C-f>"] = cmp.mapping.scroll_docs(4),

    -- 手动触发补全菜单（Ctrl+空格）
    ["<C-Space>"] = cmp.mapping.complete(),

    -- 关闭补全菜单（Ctrl+e）
    ["<C-e>"] = cmp.mapping.close(),

    -- 回车确认补全项（<CR>）
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert, -- 插入选中项（而不是替换）
      select = true, -- 若无选中项，默认选中第一项
    },

    -- Tab 键：补全选择 / 跳转 LuaSnip 插片
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item() -- 如果补全菜单可见，选中下一项
      elseif require("luasnip").expand_or_jumpable() then
        require("luasnip").expand_or_jump() -- 如果可以展开或跳转 snippet，则执行
      else
        fallback() -- 否则执行 Tab 默认功能（缩进等）
      end
    end, { "i", "s" }), -- 生效于插入模式（i）和选择模式（s）

    -- Shift + Tab 键：向上跳转 snippet 或上一个补全项
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item() -- 上一个补全项
      elseif require("luasnip").jumpable(-1) then
        require("luasnip").jump(-1) -- 向上跳转 snippet
      else
        fallback() -- 默认功能
      end
    end, { "i", "s" }),
  },

  -- 定义补全来源顺序
  sources = {
    { name = "nvim_lsp" }, -- 来自 LSP（语言服务器）的建议
    { name = "luasnip" }, -- 来自代码片段 LuaSnip
    { name = "buffer" }, -- 当前 buffer 中的文本内容
    { name = "nvim_lua" }, -- Neovim Lua API 补全
    { name = "path" }, -- 文件系统路径补全
  },
}

-- 将本地 options 与 nvchad 默认 cmp 配置合并（递归合并并强制覆盖）
return vim.tbl_deep_extend("force", options, require "nvchad.cmp")
