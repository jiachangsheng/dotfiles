return {
  -- conform.nvim 是一个轻量化的格式化插件（现代化替代 null-ls）
  -- 使用 opts = 自动调用其内置的 opts 设置机制（由 lazy.nvim 管理）
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- Neovim 官方 LSP 配置框架
  -- 用于快速启用语言服务器（如 lua_ls, tsserver, pyright 等）
  --  注意：config = function() ... end 的方式比 opts = 更自由但也更原始
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  --     highlight = {
  --       enable = true,
  --     }
  -- 	},
  -- },
}
