# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

scoop bucket add main extras nerd-fonts games

winget install Chocolatey.Chocolatey
winget install Youdao.YoudaoTranslate

scoop install git neovim pwsh python nodejs curl wget unzip 7zip gcc make
scoop install nvm fzf zoxide vieb
scoop install main/clangd
scoop install main/ripgrep

scoop install qq wechat telegram jetbrains-toolbox
#桌面管理
scoop install extras/glazewm
scoop install extras/translucenttb
scoop install extras/zebar
# 开源音频管理器
scoop bucket add nonportable
scoop install nonportable/equalizer-apo-np
scoop install nonportable/peace-np

Install-Module posh-git -Scope CurrentUser -Force
Install-Module oh-my-posh -Scope CurrentUser -Force
install-Module PSFzf -Scope CurrentUser -Force
Install-Module -Name Z -Force
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
Install-Module -Name PSFzf -Scope CurrentUser -Force
scoop install extras/notepadplusplus
scoop install extras/vcredist2022
scoop install extras/vscode
scoop install extras/sublime-text
scoop install extras/ollama-full
scoop install extras/sweethome3d
scoop install extras/gimp
scoop install extras/uninstalr
scoop install extras/xmousebuttoncontrol
scoop install extras/processhacker
scoop install extras/optimizer
scoop install main/imagemagick
scoop install extras/heynote
scoop install extras/handbrake
scoop install extras/geekbench
#用于将键盘按钮和鼠标按键映射到游戏手柄的图形程序
scoop install extras/antimicro
scoop install extras/mpv
scoop install extras/listary
scoop install extras/hibit-uninstaller
scoop install extras/openark
scoop install extras/brave
scoop install extras/sharex
scoop install extras/obs-studio
scoop install extras/autohotkey
