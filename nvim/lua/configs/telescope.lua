-- 加载 base46 缓存目录下的 telescope 基础配置
dofile(vim.g.base46_cache .. "telescope")

return {
  defaults = {
    -- 搜索框前缀图标，使用一个放大镜符号，提示用户可以输入搜索内容
    prompt_prefix = "   ",

    -- 选择项前的光标符号，这里设置为空格，让选择光标更简洁
    selection_caret = " ",

    -- 条目前缀，默认也是空格，保持条目整洁
    entry_prefix = " ",

    -- 排序策略，设置为 "ascending" 表示结果按升序排列，最新或最相关的条目在顶部
    sorting_strategy = "ascending",

    -- 窗口布局相关配置
    layout_config = {
      horizontal = {
        -- 搜索输入框放在窗口的顶部
        prompt_position = "top",

        -- 预览窗口宽度占整个窗口的55%
        preview_width = 0.55,
      },
      -- 整个 Telescope 窗口宽度占屏幕宽度的 87%
      width = 0.87,

      -- 整个 Telescope 窗口高度占屏幕高度的 80%
      height = 0.80,
    },

    -- 键盘映射配置
    mappings = {
      -- 在普通模式下，按下 q 键关闭 Telescope 窗口
      n = { ["q"] = require("telescope.actions").close },
    },
  },

  -- 需要加载的扩展列表
  extensions_list = { "themes", "terms" },

  -- 扩展的具体配置项，当前为空，表示默认
  extensions = {},
}
