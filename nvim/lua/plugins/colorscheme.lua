return {
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- 确保在其他插件之前加载
    lazy = false, -- 立即加载（不是懒加载）
    config = function()
      require("onedark").setup({
        style = "warmer", -- 可选: dark / darker / cool / deep / warm / warmer / light
      })
      require("onedark").load()
    end,
  },
}
