-- 加载 base46 缓存目录下的 mason 配置文件（通常用于基础配置或缓存预处理）
dofile(vim.g.base46_cache .. "mason")

return {
  -- 设置 PATH 变量处理方式，这里设置为 "skip" 表示跳过 PATH 相关操作
  PATH = "skip",

  -- UI 界面相关设置
  ui = {
    icons = {
      -- 软件包正在安装时显示的图标
      package_pending = " ",
      -- 软件包安装完成显示的图标
      package_installed = " ",
      -- 软件包未安装时显示的图标
      package_uninstalled = " ",
    },
  },

  -- 最大同时安装的软件包数量，默认限制为 10，防止资源过载
  max_concurrent_installers = 10,
}
