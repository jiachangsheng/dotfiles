# =====================================
# 🧩 Neovim + PowerShell 开发环境模板
# 适用于 Windows 平台
# =====================================

# 文件结构
# ├── nvim/                     Neovim 配置目录 (Git 管理)
# │   ├── init.lua
# │   └── lua/
# │       ├── core/
# │       │   ├── options.lua
# │       │   ├── keymaps.lua
# │       │   └── lazy.lua
# │       ├── plugins/
# │       │   └── ... 插件配置
# │       └── lsp/
# │           └── ... LSP 配置
# └── pwsh/                     PowerShell 配置 (dotfiles)
#     └── Microsoft.PowerShell_profile.ps1

# -------------------------------------
# 1. init.lua
# -------------------------------------

-- ~/.config/nvim/init.lua (Windows: ~/AppData/Local/nvim/init.lua)
vim.loader.enable()
require("core.options")
require("core.keymaps")
require("core.lazy")

# -------------------------------------
# 2. core/options.lua
# -------------------------------------

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.mouse = "a"

# -------------------------------------
# 3. core/keymaps.lua
# -------------------------------------

vim.g.mapleader = " "
local keymap = vim.keymap
keymap.set("n", "<leader>pv", vim.cmd.Ex)

# -------------------------------------
# 4. core/lazy.lua
# 使用 lazy.nvim 插件管理器
# -------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "L3MON4D3/LuaSnip" },
  { "lewis6991/gitsigns.nvim" },
})

# -------------------------------------
# 5. PowerShell 配置文件
# -------------------------------------

# 文件位置：C:\Users\<用户名>\Documents\PowerShell\Microsoft.PowerShell_profile.ps1

# 启用别名
Set-Alias vi nvim
Set-Alias vim nvim

# 快捷打开配置
function config-nvim {
    nvim $env:LOCALAPPDATA\nvim
}

# 自动切换路径至 Projects
function dev {
    cd ~/Projects
}

# 自动初始化环境函数（示例）
function init-env {
    Write-Host "Loading dev tools..."
    scoop update *
    scoop install git neovim pwsh python nodejs
    nvim --version
}

# -------------------------------------
# 6. Git Dotfiles 管理建议
# -------------------------------------

# 文件结构示意：
# ~/dotfiles/
# ├── nvim/  # Neovim 全部配置
# └── pwsh/  # PowerShell 配置文件

# 初始化 git
cd ~/dotfiles
git init
git remote add origin <your-repo-url>
git add .
git commit -m "init dotfiles"

git push -u origin main

# -------------------------------------
# 7. 安装 lazy.nvim (首次运行自动安装)
# -------------------------------------
# :checkhealth lazy
# :Lazy sync

# -------------------------------------
# 📦 Scoop 软件批量安装（install.ps1 示例）
# -------------------------------------

# ./install.ps1
scoop install git neovim pwsh python nodejs curl wget unzip 7zip

# 常用Git命令
| 命令                         | 说明                        |
| -------------------------- | ------------------------- |
| `git clone <repo>`         | 克隆远程 Git 仓库到本地            |
| `git status`               | 查看当前修改状态                  |
| `git add <file>` 或 `.`     | 添加修改的文件到暂存区               |
| `git commit -m "说明"`       | 提交变更到本地仓库                 |
| `git push origin main`     | 将本地 `main` 分支推送到远程仓库      |
| `git pull origin main`     | 从远程仓库拉取 `main` 分支并合并到当前分支 |
| `git log --oneline`        | 查看简洁的提交历史                 |
| `git branch`               | 查看本地分支                    |
| `git branch -r`            | 查看远程分支                    |
| `git checkout -b <branch>` | 新建并切换到新分支                 |
| `git merge <branch>`       | 合并指定分支到当前分支               |
| `git remote -v`            | 查看远程仓库地址                  |

