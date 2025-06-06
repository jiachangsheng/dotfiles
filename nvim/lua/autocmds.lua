local api = vim.api

-- 创建自动命令组的简写
local autocmd = api.nvim_create_autocmd
local augroup = api.nvim_create_augroup

-- 创建一个自动命令组，处理文件加载后的一些延迟事件（只执行一次）
local filepost_group = augroup("NvFilePost", { clear = true })

autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = filepost_group,
  callback = function(args)
    local buf = args.buf
    local file = api.nvim_buf_get_name(buf)
    local buftype = vim.bo[buf].buftype -- 更简洁获取缓冲区类型

    -- 标记 UI 初始化完成，仅标记一次
    if not vim.g.ui_entered and args.event == "UIEnter" then
      vim.g.ui_entered = true
      return -- UIEnter 事件处理完成，等待后续 BufReadPost/BufNewFile 触发
    end

    -- 仅对普通文件且 UI 已初始化时触发后续操作
    if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
      -- 触发自定义 User 事件 FilePost，通知插件执行文件后处理
      api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })

      -- 删除该组自动命令，确保只执行一次
      api.nvim_del_augroup_by_name "NvFilePost"

      -- 异步执行 FileType 自动命令，确保插件和语法完成加载
      vim.schedule(function()
        api.nvim_exec_autocmds("FileType", {})

        -- 如果启用了 editorconfig 支持，则加载对应配置
        if vim.g.editorconfig then
          -- 需要确保 editorconfig 插件已加载
          local ok, editorconfig = pcall(require, "editorconfig")
          if ok and editorconfig.config then
            editorconfig.config(buf)
          end
        end
      end)
    end
  end,
})

-- ===================================================================
-- 自动命令：复制文本后高亮
-- ===================================================================
local yank_group = augroup("CustomHighlightYank", { clear = true })
autocmd("TextYankPost", {
  group = yank_group,
  desc = "Highlight text on yank (copy)",
  callback = function()
    vim.highlight.on_yank()
  end,
})
