function Invoke-CommandRunAs {
    $cd = (Get-Location).Path
    $commands = "Set-Location $cd; Write-Host `"[Administrator] $cd> $args`"; $args; Pause; exit"
    $bytes = [System.Text.Encoding]::Unicode.GetBytes($commands)
    $encodedCommand = [Convert]::ToBase64String($bytes)
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoExit", "-encodedCommand", $encodedCommand
}


function Start-RunAs {
    $cd = (Get-Location).Path
    $commands = "Set-Location $cd; (Get-Host).UI.RawUI.WindowTitle += `" [Administrator]`""
    $bytes = [System.Text.Encoding]::Unicode.GetBytes($commands)
    $encodedCommand = [Convert]::ToBase64String($bytes)
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoExit", "-encodedCommand", $encodedCommand
}

function Reload-Profile { 
    . $profile
}

Set-Alias sudo Invoke-CommandRunAs
Set-Alias su Start-RunAs
Set-Alias reload Reload-Profile 

Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Yamauz
# Set-Theme Paradox
# Set-Theme Agnoster
# Set-Theme Honukai

$documentPath = [Environment]::GetFolderPath("MyDocuments")
$aliasPath = "\WindowsPowerShell\Alias"
$gitPath = $documentPath + $aliasPath + "\git.ps1"
$yarnPath = $documentPath + $aliasPath + "\yarn.ps1"
$chocolateyPath = $documentPath + $aliasPath + "\chocolatey.ps1"

. $gitPath
. $yarnPath
. $chocolateyPath
