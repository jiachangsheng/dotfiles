-- 载入缓存目录下的 git 样式文件（通常是 NvChad 的图标/颜色配置）
-- vim.g.base46_cache 是一个全局变量，指向 base46 缓存目录（如 ~/.cache/nvim/base46/）
dofile(vim.g.base46_cache .. "git")

-- 返回一个表，作为 gitsigns 插件的配置项
return {
  signs = {
    -- 删除行的标记样式：使用图标“󰍵”
    delete = { text = "󰍵" },

    -- 修改并删除（如替换整行）的标记样式：使用图标“󱕖”
    changedelete = { text = "󱕖" },
  },
}
