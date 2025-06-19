# 设置 PowerShell 输入输出编码为 UTF-8
# [Console]::InputEncoding = [Console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# ------------------------
# 模块加载区域
# ------------------------

# 安全导入 posh-git（Git 状态提示）
if (Get-Module -ListAvailable -Name posh-git) {
    Import-Module posh-git
}

# 加载 Terminal-Icons（美化 ls 输出，显示图标）
if (Get-Module -ListAvailable -Name Terminal-Icons) {
    Import-Module Terminal-Icons
}

# 加载 PSReadLine（增强行编辑与历史记录预测）
if ($Host.Name -eq 'ConsoleHost') {
    if (Get-Module -ListAvailable -Name PSReadLine) {
        Import-Module PSReadLine

        # PSReadLine 配置
        Set-PSReadLineOption -EditMode Emacs
        Set-PSReadLineOption -BellStyle None
        # Set-PSReadLineOption -PredictionViewStyle ListView
        # Set-PSReadLineOption -PredictionSource HistoryAndPlugin

        # 快捷键绑定
        Set-PSReadLineKeyHandler -Key Escape -ScriptBlock {
            [console]::Clear()
            [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
        }

        Set-PSReadLineKeyHandler -Chord Ctrl+e -Function EndOfLine
        Set-PSReadLineKeyHandler -Chord Ctrl+b -Function BeginningOfLine
        Set-PSReadLineKeyHandler -Key Tab -Function TabCompleteNext
    }
}

# 加载 PSFzf（fzf 模糊查找集成）
if (Get-Module -ListAvailable -Name PSFzf) {
    Import-Module PSFzf
    Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'
}

# 初始化 zoxide（现代目录跳转工具）
Invoke-Expression (& { $(zoxide init powershell | Out-String) })

# 初始化 oh-my-posh（美化提示符，CLI 版本）
# 这里使用 scoop 安装路径，自动定位当前主题
#
# $ompTheme = Join-Path $env:POSH_THEMES_PATH "takuya.omp.json"
# if (Test-Path $ompTheme) {
#     oh-my-posh init pwsh --config $ompTheme | Invoke-Expression
# }

# ------------------------
# 环境变量与别名设置区域
# ------------------------

# 设置 GIT SSH 工具路径（使用系统内置的 ssh.exe）
$env:GIT_SSH = "C:\Windows\System32\OpenSSH\ssh.exe"

# 常用命令别名设置
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# 快捷函数：用 emacs -nw 打开文件（终端内 Emacs）
function em {
    emacs -nw @args
}

# 快捷函数：模拟 Unix 的 `which` 命令
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# 快捷函数：在 nvim 中查看 PowerShell 帮助文档
function HelpNvim {
    param ([string]$Command)
    $tmp = "$env:TEMP\$Command-help.txt"
    Get-Help $Command -Full | Out-File -Encoding utf8 $tmp
    nvim $tmp
}

# 快捷函数：使用 Brave 浏览器打开网页为 app 模式
function app {
    param (
        [Parameter(Mandatory = $true)]
        [string]$url
    )

    $chromePath = Join-Path $env:USERPROFILE "scoop\apps\brave\current\brave.exe"
    if (-Not ($url -match "^https?://")) {
        $url = "https://$url"
    }

    Start-Process $chromePath "--app=$url"
}
