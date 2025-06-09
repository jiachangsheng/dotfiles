# 先备份原配置目录（如果存在）
# Rename-Item "$env:LOCALAPPDATA\nvim" "nvim_backup" -ErrorAction SilentlyContinue

# 创建 nvim 目录软链接

New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim" -Target "$pwd"
