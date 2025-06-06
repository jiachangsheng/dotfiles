-- 定义一个模块表 M，用于导出多个配置项
local M = {}

-- 设置快捷键映射的简写
local map = vim.keymap.set

-- 当某个语言服务连接到某个 buffer 时调用的回调函数
M.on_attach = function(_, bufnr)
  -- 每个快捷键附加描述，并仅作用于当前 buffer
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  -- 常用 LSP 快捷键绑定
  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")
  map("n", "<leader>wl", function()
    -- 显示当前工作区文件夹列表
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")
  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")

  -- 使用 NvChad 的重命名插件（renamer）
  map("n", "<leader>ra", require "nvchad.lsp.renamer", opts "NvRenamer")
end

-- 客户端初始化时调用：关闭 semanticTokens（防止颜色高亮冲突）
M.on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

-- 配置 LSP 的 capabilities（客户端能力）用于增强补全等功能
M.capabilities = vim.lsp.protocol.make_client_capabilities()

-- 细化 completionItem 的能力
M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" }, -- 支持文档格式
  snippetSupport = true, -- 支持代码片段
  preselectSupport = true, -- 支持候选项预选
  insertReplaceSupport = true, -- 插入替换支持
  labelDetailsSupport = true, -- 支持 label 细节
  deprecatedSupport = true, -- 支持废弃提示
  commitCharactersSupport = true, -- 支持自动补全确认字符
  tagSupport = { valueSet = { 1 } }, -- 支持标签（用于标注废弃项等）
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits", -- 支持补充编辑操作（如 import 补全）
    },
  },
}

-- 默认初始化函数，用于统一设置各语言服务器
M.defaults = function()
  -- 加载 LSP 样式配置（如诊断样式）
  dofile(vim.g.base46_cache .. "lsp")

  -- 配置诊断提示（如下划线、虚线、图标）
  require("nvchad.lsp").diagnostic_config()

  -- 设置自动事件，在每次 LSP 连接到 buffer 时，调用 on_attach
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      M.on_attach(_, args.buf)
    end,
  })

  -- 特别配置 Lua LSP（适配 Neovim 内部 API）
  local lua_lsp_settings = {
    Lua = {
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua", -- Neovim 内部 Lua API
          vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types", -- NvChad 类型定义
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy", -- lazy.nvim 代码库
          "${3rd}/luv/library", -- Lua Luv 运行库
        },
      },
    },
  }

  -- 针对 Neovim v0.10 的临时兼容方案
  if vim.lsp.config then
    -- 统一设置所有语言服务器的 capabilities 和初始化
    vim.lsp.config("*", { capabilities = M.capabilities, on_init = M.on_init })
    -- 单独配置 Lua 语言服务器
    vim.lsp.config("lua_ls", { settings = lua_lsp_settings })
    -- 启用 Lua 语言服务器
    vim.lsp.enable "lua_ls"
  else
    -- 老版本 fallback：使用 lspconfig 配置 Lua LSP
    require("lspconfig").lua_ls.setup {
      capabilities = M.capabilities,
      on_init = M.on_init,
      settings = lua_lsp_settings,
    }
  end
end

-- 返回模块 M，供其他配置文件调用
return M
