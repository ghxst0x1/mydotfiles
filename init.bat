@ECHO
color c
title Batch Script for installing powershell modules

REM Installing PSFzf
powershell Install-Module -Name PSFzf -Scope CurrentUser

@REM Installing PSReadLine
@REM Install-Module -Name PSReadLine

@REM REM Installing Terminal-Icons
@REM Install-Module -Name Terminal-Icons

@REM REM Installing z
@REM Install-Module -Name z

PAUSE
