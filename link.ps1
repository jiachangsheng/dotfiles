# 先备份原配置目录（如果存在）
Rename-Item "$env:LOCALAPPDATA\nvim" "nvim_backup" -ErrorAction SilentlyContinue
Rename-Item "$env:USERPROFILE\Documents\PowerShell" "PowerShell_backup" -ErrorAction SilentlyContinue

# 进入 dotfiles 目录
cd ~/dotfiles

# 创建 nvim 目录软链接
New-Item -ItemType SymbolicLink `
  -Path "$env:LOCALAPPDATA\nvim" `
  -Target "$PWD\nvim"

# 创建 pwsh 配置软链接
New-Item -ItemType SymbolicLink `
  -Path "$env:USERPROFILE\Documents\PowerShell" `
  -Target "$PWD\pwsh"

