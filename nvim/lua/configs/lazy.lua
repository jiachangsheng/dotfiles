return {
  -- 所有插件默认使用懒加载
  -- 除非在插件声明中显式写明 lazy = false，否则插件会延迟加载（例如通过事件、命令、文件类型等触发加载）
  -- 这样做可以优化 Neovim 启动速度，是 Lazy.nvim 推荐的配置方式
  defaults = { lazy = true },

  -- 安装配置部分
  -- 如果没有手动设置 colorscheme，lazy.nvim 会尝试加载 "nvchad" 主题
  -- 注意："nvchad" 不是 Neovim 官方的主题，而是 NvChad 框架中基于 base46 动态生成的主题
  -- install = { colorscheme = { "nvchad" } },

  -- Lazy.nvim 的界面配置
  ui = {
    icons = {
      -- 文件类型图标，用于 :Lazy 命令的插件列表显示
      ft = "",
      -- 懒加载标识图标
      lazy = "󰂠 ",
      -- 插件已加载标识
      loaded = "",
      -- 插件未加载标识
      not_loaded = "",
    },
  },

  -- 性能优化配置
  performance = {
    rtp = {
      -- 禁用 Neovim 自带的一些默认插件，这些插件可能不常用或者功能冗余
      -- 禁用后可以减少启动时的插件加载，提高性能
      disabled_plugins = {
        "2html_plugin", -- 用于将文本转换成 HTML，不常用
        "tohtml", -- 同上
        "getscript", -- 用于下载脚本，不常用
        "getscriptPlugin", -- 同上
        "gzip", -- 支持压缩文件打开
        "logipat", -- 日志相关插件
        "netrw", -- 默认文件浏览器，常被替代
        "netrwPlugin", -- netrw 插件部分
        "netrwSettings", -- netrw 设置
        "netrwFileHandlers", -- netrw 文件处理
        "matchit", -- 增强的匹配括号插件
        "tar", -- 支持 tar 文件
        "tarPlugin", -- tar 插件部分
        "rrhelper", -- 远程运行帮助插件
        "spellfile_plugin", -- 拼写文件支持
        "vimball", -- 支持 vimball 压缩包
        "vimballPlugin", -- vimball 插件部分
        "zip", -- 支持 zip 文件
        "zipPlugin", -- zip 插件部分
        "tutor", -- 新手教程
        "rplugin", -- 远程插件支持
        "syntax", -- 语法支持（关闭后需确认不影响其他功能）
        "synmenu", -- 语法菜单
        "optwin", -- 窗口选项菜单
        "compiler", -- 编译器支持
        "bugreport", -- 错误报告工具
        "ftplugin", -- 文件类型插件（关闭后需确认不影响常用功能）
      },
    },
  },
}
