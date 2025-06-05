local options = {
  -- 该字段用于指定每种文件类型使用哪个格式化器。
  -- 通过：Mason命令进行安装
  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  -- 保存的时候自动格式化，或者通过：Format命令进行手动格式化
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
