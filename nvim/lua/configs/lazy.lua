return {
  -- 所有插件默认使用懒加载
  -- 除非在插件声明中显式写明 lazy = false，否则插件会延迟加载（例如通过事件、命令、文件类型等触发加载）
  --  优化启动速度，是 Lazy.nvim 推荐设置
  defaults = { lazy = true },

  -- 表示如果没有手动设置 colorscheme，lazy.nvim 会尝试加载 nvchad 这个 colorscheme
  -- 注意："nvchad" 并不是 Neovim 官方的 colorscheme，而是在 NvChad 体系中动态由 base46 管理的主题（它会在运行时生成相应 colorscheme 文件）
  install = { colorscheme = { "nvchad" } },

  -- 这些图标用于 :Lazy 命令时显示的界面，帮助你可视化查看插件状态
  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },

  -- 性能优化：禁用内置插件（Neovim 自带）
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
}
