# Save this as sync-git.ps1
$branch = "main"
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

Write-Host "`n开始同步 Git 仓库（$branch 分支）..." -ForegroundColor Cyan

# 检查 Git 是否安装
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "Git 未安装，请先安装 Git。"
    exit 1
}

# 1. 拉取主仓库变更
Write-Host "拉取远程主仓库更新..." -ForegroundColor Yellow
git pull origin $branch

# 2. 初始化并更新子模块（如有）
if (Test-Path ".gitmodules") {
    Write-Host "检测到子模块，正在初始化并更新..." -ForegroundColor Yellow
    git submodule update --init --recursive
    git submodule foreach --recursive 'git pull origin $(git symbolic-ref --short HEAD)'
} else {
    Write-Host "未检测到子模块，跳过子模块更新。" -ForegroundColor DarkGray
}

# 3. 添加所有变更
Write-Host "添加所有更改到暂存区..." -ForegroundColor Yellow
git add .

# 4. 提交本地更改（忽略无变更报错）
Write-Host "提交本地更改..." -ForegroundColor Yellow
git commit -m "更新于 $timestamp" 2>$null

# 5. 推送主仓库
Write-Host "推送到远程主仓库..." -ForegroundColor Yellow
git push origin $branch

Write-Host "`nGit 仓库同步完成。" -ForegroundColor Green
