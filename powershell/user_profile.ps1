# Prompt
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt Paradox

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
