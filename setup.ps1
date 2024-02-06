# Check if running as administrator
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Please run this script as an administrator."
    Exit
}

# Enable PowerShell script execution
Set-ExecutionPolicy Bypass -Scope Process -Force

# Install Windows Package Manager (winget)
$wingetInstalled = Get-Command winget -ErrorAction SilentlyContinue
if (-not $wingetInstalled) {
    Write-Host "Installing Windows Package Manager (winget)..."
    Invoke-Expression "iex ((New-Object System.Net.WebClient).DownloadString('https://aka.ms/install-powershell.ps1'))"
} else {
    Write-Host "Winget Already Installed"
}

# Install Scoop
$scoopInstalled = Test-Path $env:USERPROFILE\scoop
if (-not $scoopInstalled) {
    Write-Host "Installing Scoop..."
    Invoke-Expression "iex (new-object net.webclient).downloadstring('https://get.scoop.sh')"
} else {
    Write-Host "Scoop Already Installed"
}

# Install Oh-my-posh
$wingetInstalled = Get-Command oh-my-posh -ErrorAction SilentlyContinue
if (-not $wingetInstalled) {
    Write-Host "Installing Oh-My-Posh..."
    Invoke-Expression "iex((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))"
} else {
    Write-Host "Oh-My-Posh Already Installed"
}

# Add Scoop buckets
scoop bucket add extras
scoop bucket add nerd-fonts
scoop bucket add versions

# Install packages using Scoop
$packages = @("7zip","curl", "aria2c", "lsd")
foreach ($package in $packages) {
    Write-Host "Installing $package..."
    scoop install $package
}

# Install CaskaydiaCove Nerd Font using Scoop
$nerdFontInstalled = Test-Path "$env:USERPROFILE\scoop\apps\nerd-fonts\current"
if (-not $nerdFontInstalled) {
    Write-Host "Installing CaskaydiaCove Nerd Font..."
    scoop install nerd-fonts/CaskaydiaCove-Nerd-Font
}

# Install packages using Winget
$wingetPackages = @(
    "Git.Git",
    "Discord.Discord.PTB",
    "Valve.Steam",
    "Brave.Brave.Beta",
    "Microsoft.VisualStudioCode.Insiders",
    "VideoLAN.VLC",
    "Logitech.GHUB",
    "qBittorrent.qBittorrent",
    "WinSCP.WinSCP",
    "DuongDieuPhap.ImageGlass",
    "9P8LTPGCBZXD",
    "9N5JJZW4QZBR",
    "voidtools.Everything",
    "Soulseek.SoulseekQt",
    "Google.NearbyShare",
    "DuongDieuPhap.ImageGlass",
    "Stremio.Stremio",
    "OBSProject.OBSStudio",
    "HandBrake.HandBrake",
    "Avidemux.Avidemux",
    "VMware.WorkstationPro",
    "EpicGames.EpicGamesLauncher",
    "Notepad++.Notepad++")
# 9N5JJZW4QZBR - XtremeDownloadManager
# 9P8LTPGCBZXD - Wintoys
# Optional with no sources
# NetLimiter, Peace + Equalizer APO,  
foreach ($package in $wingetPackages){
    Write-Host "Installing $package using Winget..."
    winget install --id $package -e -q
}

# Install PowerShell modules
$modules = @("terminal-icons", "psReadline", "psfzf", "z")
foreach ($module in $modules) {
    Write-Host "Installing PowerShell module $module..."
    Install-Module -Name $module -Force -Scope CurrentUser
}

#copying files
Write-Host "Copying config files..."
Write-Host "Warning!!! This will overwrite current profile configuration" -ForegroundColor Red
$currentdir = Get-Location
$destdir = "C:\Users\$env:USERNAME\documents"

Copy-Item -Path $currentdir\PowerShell -Destination $destdir -Recurse -Force

# Check if the copy was successful
if (Test-Path -Path $destdir\PowerShell) {
    Write-Host "Folder copied successfully to $destinationFolder"
} else {
    Write-Host "Failed to copy folder to $destinationFolder"
}


Write-Host "Installation complete."
