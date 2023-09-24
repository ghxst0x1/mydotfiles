Write-Host Start -ForegroundColor Cyan

Get-ExecutionPolicy 


Write-Host Installing PSFzf -ForegroundColor Yellow
powershell Install-Module -Name PSFzf

Write-Host Installing PSReadLine -ForegroundColor Yellow
Install-Module -Name PSReadLine

Write-Host Installing Terminal-Icons -ForegroundColor Yellow
Install-Module -Name Terminal-Icons

Write-Host Installing z -ForegroundColor Yellow
Install-Module -Name z

Write-Host Installing Scoop -ForegroundColor Yellow
irm get.scoop.sh | iex

Write-Host Done -ForegroundColor Green
