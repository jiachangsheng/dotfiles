-- 定义 conform.nvim 的配置项
local options = {
  -- 为不同的文件类型指定所使用的格式化器
  -- 你可以通过命令 :Mason 打开插件管理器安装这些格式化器
  formatters_by_ft = {
    -- Lua 文件将使用 stylua 格式化
    lua = { "stylua" },

    -- 可以添加其他格式化器，例如 prettier（前端常用）：
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  -- 设置保存文件时自动触发格式化的行为
  format_on_save = {
    timeout_ms = 500, -- 最多等待 500 毫秒，超时则跳过格式化
    lsp_fallback = true, -- 如果没有设置格式化器，就使用 LSP 自带的格式化功能（如有）
  },
}

-- 返回配置表供插件使用
return options
