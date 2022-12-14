# oh-my-posh init pwsh | Invoke-Expression
# Import-Module oh-my-posh

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/mytheme.omp.json" | Invoke-Expression
#Invoke-Expression (&starship init powershell)

Import-Module -Name Terminal-Icons

Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
# Set-PSReadLineOption -PredictionViewStyle Listview

Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

Set-Alias vim nvim
Set-Alias grep findstr
Set-Alias code code-insiders
Set-Alias eth get-netadapter

function which ($arg) {
  Get-Command -Name $arg -ErrorAction SilentlyContinue |
     Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function here {
  start explorer .
}

function lab {
	cd $HOME/documents/github
}

function clean_up {
  sudo D:\SysMod\Cache_Cleaner.bat
}

function note {
	echo "date: $(date)" >> $HOME/notes.txt
	echo "$args" >> $HOME/notes.txt
	echo "" >> $HOME/notes.txt
}

function chrome {
 START "C:\Program Files\Google\Chrome\Application\chrome.exe" --Incognito
}

function brave {
 START "C:\Program Files\BraveSoftware\Brave-Browser-Beta\Application\brave.exe" --incognito
}
