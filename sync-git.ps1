# Save this as sync-git.ps1
$branch = "main"
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

Write-Host "`n🔁 开始同步 Git 仓库（$branch 分支）..."

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "❌ Git 未安装，请先安装 Git。"
    exit 1
}

# 拉取远程仓库更新
git pull origin $branch

# 添加所有变更
git add .

# 提交本地更改
git commit -m "📝 更新于 $timestamp" 2>$null

# 推送到远程仓库
git push origin $branch

Write-Host "`n✅ Git 同步完成。" -ForegroundColor Green

