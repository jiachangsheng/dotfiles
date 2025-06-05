# 设置管理员权限
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# 安装scoop
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

winget install Chocolatey.Chocolatey
winget install Youdao.YoudaoTranslate

scoop bucket add main
scoop bucket add extras
scoop bucket add nerd-fonts
scoop bucket add games
scoop bucket add versions
# 常用字体
scoop install nerd-fonts/Hack-NF
scoop install nerd-fonts/Hack-NF-Mono
scoop install nerd-fonts/JetBrains-Mono

scoop install main/git
scoop install main/neovim
# 跨平台自动化和配置工具/框架，称为 Powershell Core。
scoop install main/pwsh

# 用于 C/C++ 的语言服务器，由 LLVM 项目提供
scoop install main/clangd
# GNU 编译器集合和 binutils
scoop install main/gcc
# 构建自动化工具。
scoop install main/make

scoop install main/python
# 适用于 Windows 的 node.js 版本管理实用程序。
scoop install main/nvm
scoop install main/nodejs

scoop install extras/brave
scoop install extras/qq
scoop install extras/wechat
scoop install extras/telegram
scoop install extras/jetbrains-toolbox
# Vim Inspired Electron 浏览器
scoop install extras/vieb

#桌面管理
scoop install extras/glazewm
scoop install extras/translucenttb
scoop install extras/zebar
# 开源音频管理器
scoop bucket add nonportable
scoop install nonportable/equalizer-apo-np
scoop install nonportable/peace-np

scoop install main/unzip
scoop install main/7zip
# 用于通过 URL 传输数据的命令行工具和库
scoop install main/curl

# 递归搜索目录以查找正则表达式模式。
scoop install main/ripgrep

Install-Module posh-git -Scope CurrentUser -Force
Install-Module oh-my-posh -Scope CurrentUser -Force
Install-Module Terminal-Icons -Repository PSGallery -Force
scoop install main/fzf
Install-Module PSFzf -Scope CurrentUser -Force
Install-Module Z -Force
scoop install main/zoxide
Install-Module PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck

scoop install extras/notepadplusplus
scoop install extras/vcredist2022
scoop install extras/vscode
scoop install extras/sublime-text
scoop install extras/ollama-full
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
#用于将键盘按钮和鼠标按键映射到游戏手柄的图形程序
scoop install extras/antimicro
scoop install extras/mpv
scoop install extras/listary
scoop install extras/hibit-uninstaller
# 反 rookit（ARK） 工具
scoop install extras/openark
scoop install extras/sharex
# 视频录制和直播软件
scoop install extras/obs-studio
# 适用于 Windows 的终极自动化脚本语言。
scoop install extras/autohotkey
# 一个现代的双窗格文件管理器，具有选项卡、列视图、内置预览、可编辑主题等。
scoop install extras/onecommander
scoop install stylua
scoop install main/stylua
