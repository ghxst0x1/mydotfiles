@ECHO OFF
color c
title Batch Script for installing powershell modules

Powershell.exe -executionpolicy remotesigned -File setup.ps1

PAUSE
