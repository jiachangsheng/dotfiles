# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# posh-git
Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot ".\takuya.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
# Set-PSReadLineOption -EditMode vi
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
<<<<<<< HEAD
# set-PSReadLineOption -PredictionviewStyle ListView
=======
# 将 Ctrl+h 映射为 ←
Set-PSReadLineKeyHandler -Chord 'Ctrl+h' -Function BackwardChar

# 将 Ctrl+l 映射为 →
Set-PSReadLineKeyHandler -Chord 'Ctrl+l' -Function ForwardChar

# 将 Ctrl+j 映射为 ↓（下一个历史命令）
Set-PSReadLineKeyHandler -Chord 'Ctrl+j' -Function NextHistory

# 将 Ctrl+k 映射为 ↑（上一个历史命令）
Set-PSReadLineKeyHandler -Chord 'Ctrl+k' -Function PreviousHistory
# Set-PSReadLineKeyHandler -Chord "Ctrl+l" -Function AcceptSuggestion
# Set-PSReadLineKeyHandler -Chord "Ctrl+h" -Function Backwardkillword
>>>>>>> e58ab14ab56c2b7b7014e1c73adf4f8c2fef5bfd

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

