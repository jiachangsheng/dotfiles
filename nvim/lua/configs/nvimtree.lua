-- 加载 base46 缓存目录下的 nvimtree 配置文件（通常是基础配置或缓存预处理）
dofile(vim.g.base46_cache .. "nvimtree")

return {
  -- 过滤器设置，是否隐藏以点号开头的隐藏文件，这里设置为 false，表示不隐藏隐藏文件
  filters = { dotfiles = false },

  -- 禁用内置的 netrw 文件浏览器，避免和 nvim-tree 冲突
  disable_netrw = true,

  -- 光标自动跳转到当前选中文件，提升浏览体验
  hijack_cursor = true,

  -- 同步根目录和当前工作目录，当切换目录时自动更新 nvim-tree 根目录
  sync_root_with_cwd = true,

  -- 跟踪当前打开的文件，自动聚焦对应文件在树视图中的位置
  update_focused_file = {
    enable = true, -- 启用跟踪当前打开文件
    update_root = false, -- 是否自动更新根目录，这里关闭
  },

  -- 视图相关设置
  view = {
    width = 30, -- 窗口宽度为30列
    preserve_window_proportions = true, -- 保持窗口大小比例，避免自动调整
  },

  -- 渲染相关设置，控制图标、显示样式等
  renderer = {
    root_folder_label = false, -- 不显示根目录的标签，界面更简洁
    highlight_git = true, -- 启用 git 状态高亮显示
    indent_markers = { enable = true }, -- 启用目录缩进标记（树形结构显示）
    icons = {
      glyphs = { -- 图标具体样式定义
        default = "󰈚", -- 默认文件图标
        folder = { -- 文件夹图标配置
          default = "", -- 普通文件夹
          empty = "", -- 空文件夹
          empty_open = "", -- 打开的空文件夹
          open = "", -- 打开的文件夹
          symlink = "", -- 符号链接文件夹
        },
        git = { unmerged = "" }, -- Git状态中未合并文件的图标
      },
    },
  },
}
