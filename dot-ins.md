# CMD>安装pwsh和Git
winget install Mrcrosoft.PowerShell
winget install Git.Git
# 设置git使用代理
git config --global http.proxy http://127.0.0.1:7890
git config --global https.proxy http://127.0.0.1:7890
# 设置软件跟新环境代理
$env:http_proxy="http://127.0.0.1:7890"
$env:https_proxy="http://127.0.0.1:7890"

# 拉取dotfiles项目
git clone https://github.com/jiachangsheng/dotfiles.git

# 安装必要的bucket
scoop bucket add main extras nerd-fonts games versions nonportable

# 检查pwsh模块是否安装
foreach ($m in @("Terminal-Icons", "posh-git", "PSFzf")) {
    if (-not (Get-Module -ListAvailable -Name $m)) {
        Install-Module $m -Scope CurrentUser -Force
    }
}
# 检查pwsh CLI 是否安装
foreach ($cli in @("fzf", "zoxide", "oh-my-posh","ripgrep")) {
    if (-not (Get-Command $cli -ErrorAction SilentlyContinue)) {
        scoop install $cli
    }
}

# 企业包管理（可选）
winget install Chocolatey.Chocolatey
# 有道云翻译
winget install Youdao.YoudaoTranslate

# 添加HOME为环境变量,个人配置都在dotfiles里面用git管理
[System.Environment]::SetEnvironmentVariable("HOME", "C:\Users\ussername\dotfiles", "User")

# pwsh>设置管理员权限
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# pwsh>安装scoop
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# 安装emacs客户端
scoop install emacs
# 常用软件下载
scoop install brave qq wechat telegram jetbrains-toolbox notepadplusplus vscodium
scoop install ollama mpv vlc listary hibit-uninstaller sharex onecommander everything
scoop install fd shellcheck pandoc zip

# 终端或者其它（使用字体的时候要查清楚名称，名称有的时候不一定是fonts里面的名称）
scoop install nerd-fonts/Hack-NF-Mono
scoop install nerd-fonts/FiraCode
# space字体
scoop install nerd-fonts/SourceCodePro-NF-Mono
# doom字体,emacs查询字体名称方法<M-: (font-family-list)>
scoop install nerd-fonts/JetBrainsMono-NF-Mono
# doom图标
scoop install nerd-fonts/NerdFontsSymbolsOnly

# 桌面管理
scoop install glazewm translucenttb zebar
# 开源音频管理器
scoop install equalizer-apo-np peace-np






# Vim Inspired Electron 浏览器
scoop install extras/vieb
# 室内设计应用程序
scoop install extras/sweethome3d
# GNU 图像处理程序
scoop install extras/gimp
# 一种在 Windows 中卸载软件的快速、轻量级和准确的方法。
scoop install extras/uninstalr
# Windows 工具，允许重新配置和扩展鼠标的功能。
scoop install extras/xmousebuttoncontrol
# 一款功能强大的多功能工具，可帮助您监控系统资源、调试软件和检测恶意软件。
scoop install versions/processhacker-nightly
# 一种高级配置实用程序，可帮助您恢复隐私并提高安全性。
scoop install extras/optimizer
# 创建、编辑、合成和转换 200+ 位图图像格式。
scoop install main/imagemagick
# 开发人员专用的便笺簿
scoop install extras/heynote
# 一种用于将视频从几乎任何格式转换为一系列广泛支持的现代编解码器的工具。
scoop install extras/handbrake
# CPU/GPU 基准测试软件
scoop install extras/geekbench
# 用于将键盘按钮和鼠标按键映射到游戏手柄的图形程序
scoop install extras/antimicro
# 反 rookit（ARK） 工具
scoop install extras/openark
# 视频录制和直播软件
scoop install extras/obs-studio
# 适用于 Windows 的终极自动化脚本语言。
scoop install extras/autohotkey
# 开源的本地网络设备通讯工具
scoop install extras/kdeconnect
