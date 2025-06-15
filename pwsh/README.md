
# 通过命令 nvim $PROFILE 进入源配置,添加以下代码,以下代码的作用就是读取dotfiles\USERPROFILE\dotfiles\pwsh\里面备份的配置

. $env:USERPROFILE\dotfiles\pwsh\user_profile.ps1
