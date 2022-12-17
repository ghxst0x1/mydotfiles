Write-Host Start

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

Write-Host Installing PSFzf
powershell Install-Module -Name PSFzf -Scope CurrentUser

Write-Host Installing PSReadLine
Install-Module -Name PSReadLine

Write-Host Installing Terminal-Icons
Install-Module -Name Terminal-Icons

Write-Host Installing z
Install-Module -Name z

Write-Host Installing Scoop
irm get.scoop.sh | iex

Write-Host Done
