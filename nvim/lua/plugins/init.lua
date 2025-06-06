return {
  -- 💼 常用 Lua 工具函数库，很多插件依赖它（必须加载）
  "nvim-lua/plenary.nvim",

  -- 🎨 NvChad 的主题系统 base46：用于加载颜色、字体等高亮配置
  {
    "nvchad/base46",
    build = function()
      -- 安装完成后自动构建高亮缓存
      require("base46").load_all_highlights()
    end,
  },

  -- 🧱 NvChad UI 框架（提供界面组件）
  {
    "nvchad/ui",
    lazy = false, -- 禁用懒加载，必须立即加载（否则界面会错乱）
    config = function()
      require "nvchad" -- 加载主配置（会自动读取 chadrc）
    end,
  },

  -- 🧩 UI 插件：增强启动界面与菜单（来自社区）
  "nvzone/volt",
  "nvzone/menu",
  { "nvzone/minty", cmd = { "Huefy", "Shades" } }, -- 仅在使用这两个命令时加载

  -- 🗂️ 文件图标（提供 devicon 支持）
  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      -- 使用 base46 缓存图标高亮
      dofile(vim.g.base46_cache .. "devicons")
      return {
        override = require "nvchad.icons.devicons", -- 使用 NvChad 自定义图标
      }
    end,
  },

  -- 📏 缩进显示插件（用于显示缩进线）
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost", -- 文件加载后再加载（提高性能）
    opts = {
      indent = { char = "│", highlight = "IblChar" }, -- 普通缩进线样式
      scope = { char = "│", highlight = "IblScopeChar" }, -- 代码块范围线样式
    },
    config = function(_, opts)
      -- 加载 base46 主题缓存
      dofile(vim.g.base46_cache .. "blankline")

      local hooks = require "ibl.hooks"
      -- 首行缩进隐藏
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)

      -- 启动插件
      require("ibl").setup(opts)
    end,
  },

  -- 🌲 文件树插件（项目目录导航器）
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" }, -- 仅在调用命令时加载
    opts = function()
      return require "configs.nvimtree" -- 加载你定义的 nvimtree 配置
    end,
  },

  -- ⌨️ 快捷键提示插件
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" }, -- 哪些按键触发加载
    cmd = "WhichKey",
    opts = function()
      dofile(vim.g.base46_cache .. "whichkey") -- 加载主题缓存
      return {}
    end,
  },

  -- 🧹 格式化插件（轻量替代 null-ls）
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- 写入前触发格式化
    opts = require "configs.conform", -- 载入格式化配置
  },

  -- 🧾 Git 状态提示插件（显示修改行）
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      return require "configs.gitsigns"
    end,
  },

  -- 📦 LSP 安装器插件（用于安装语言服务器）
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" }, -- 仅运行命令时加载
    opts = function()
      return require "configs.mason"
    end,
  },

  -- 🧠 LSP 配置插件（配置语言服务器，如 lua、ts、py 等）
  {
    "neovim/nvim-lspconfig",
    event = "User FilePost", -- 文件加载完成后再加载（优化性能）
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- ✍️ 自动补全框架
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- 插入模式下加载
    dependencies = {
      -- 🔌 片段插件（用于 snippet 支持）
      {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets", -- 常用代码片段
        opts = {
          history = true, -- 支持历史跳转
          updateevents = "TextChanged,TextChangedI",
        },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require "configs.luasnip"
        end,
      },

      -- 🧠 括号自动闭合插件
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {}, -- 快速括号闭合
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- 与 cmp 集成自动补全闭合符号
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- 📥 cmp 的补全源（从 snippet、buffer、LSP、路径补全）
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = function()
      return require "configs.cmp"
    end,
  },

  -- 🔍 文件查找插件（模糊搜索）
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- 依赖 treesitter 提供语法信息
    cmd = "Telescope", -- 只在使用命令时加载
    opts = function()
      return require "configs.telescope"
    end,
  },

  -- 🌳 高亮引擎（语法高亮、折叠、结构跳转等）
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate", -- 安装后自动更新语言模块
    opts = function()
      return require "configs.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
