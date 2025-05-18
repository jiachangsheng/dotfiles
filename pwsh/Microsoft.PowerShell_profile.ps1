Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/tokyo.omp.json" | Invoke-Expression

Import-Module posh-git

Import-Module Terminal-Icons


# Alias
Set-Alias vm nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

function config-nvim{
    nvim $env:LOCALAPPDATA\nvim
  }

function dev{
    cd ~/Projects
  }

function init-env{
    Write-Host "Loading dev tools..."
    scoop update *
    scoop install git neovim pwsh python nodejs curl wget unzip 7zip
    nvim --version
  }

