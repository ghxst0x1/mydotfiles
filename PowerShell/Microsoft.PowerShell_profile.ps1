# Initialize oh-my-posh if needed
# Import-Module oh-my-posh
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/emodipt-extend.omp.json" | Invoke-Expression

# Starship prompt configuration
$ENV:STARSHIP_CONFIG = "$HOME\.config\dwm.toml"
Invoke-Expression (&starship init powershell)

# Import Terminal-Icons module
Import-Module -Name Terminal-Icons

# PSReadLine options
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
#Set-PSReadLineOption -PredictionSource History
#Set-PSReadLineOption -PredictionViewStyle Listview

#Import-Module PSFzf
#Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Set aliases
Set-Alias grep findstr
Set-Alias code code-insiders
#Set-Alias eth get-netadapter

# Define functions
function ll {
    lsd -l
}

function which ($arg) {
    Get-Command -Name $arg -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function go {
    Start-Process explorer .
}

function npp {
    Start-Process "C:\Program Files\Notepad++\notepad++.exe" -ArgumentList $args
}

function lab {
    Set-Location $HOME/documents/github
}

function serv {
    #Set-Location $env:BIN
    #./ngrok.exe http $args
	python -m http.server 80
}

function note {
    $date = Get-Date
    $content = "`ndate: $date`n$args`n"
    $content | Out-File -Append -FilePath $HOME/notes.txt
}

function govim {
    Set-Location $env:LOCALAPPDATA/nvim
}

function hostedit {
    Start-Process notepad "c:\Windows\System32\Drivers\etc\hosts" -Verb runAs
}

function histedit {
    notepad "$HOME\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"
}

# Import Chocolatey profile for tab completion
#$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
#if (Test-Path $ChocolateyProfile) {
#    Import-Module $ChocolateyProfile
#}
