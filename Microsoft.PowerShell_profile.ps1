
# Load posh-git example profile
. 'C:\repo\github\posh-git\profile.example.ps1'

$global:GitPromptSettings.WorkingForegroundColor    = [ConsoleColor]::Yellow 
$global:GitPromptSettings.LocalWorkingStatusForegroundColor  = [ConsoleColor]::Yellow
$global:GitPromptSettings.WorkingForegroundBrightColor  = [ConsoleColor]::Yellow
$global:GitPromptSettings.BeforeStashForegroundColor  = [ConsoleColor]::Yellow
$global:GitPromptSettings.LocalWorkingStatusForegroundBrightColor  = [ConsoleColor]::Yellow
$global:GitPromptSettings.BranchBehindStatusForegroundColor  = [ConsoleColor]::Yellow
$global:GitPromptSettings.AfterStashForegroundColor  = [ConsoleColor]::Yellow
$global:GitPromptSettings.StashForegroundColor  = [ConsoleColor]::Yellow