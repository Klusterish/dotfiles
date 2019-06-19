Import-Module posh-git
Import-Module oh-my-posh

Set-Theme Avit
Set-PSReadlineOption -BellStyle None

$DefaultUser = 'olli'

# Quick tail logs alias that reminisent of bash
function Tail-Log { Get-Content $args -Wait -Tail 10 }
New-Alias -Name tail -Value Tail-Log

function Get-Clear { cls }
New-Alias -Name cl -Value Get-Clear

function Get-Vim { vim $args }
New-Alias -Name vi -Value Get-Vim

# Shortening the git usage for the less used command.
function Get-Git-Arg { git $args }
New-Alias -Name g -Value Get-Git-Arg

# Quickjump to projects dir
function Get-Projects { cd C:\Users\oleg.lindvin\Documents\Projects\ }
New-Alias -Name pro -Value Get-Projects

# Quickjump to home dir
function Get-Home { cd ~ }
New-Alias -Name home -Value Get-Home

# Have the same functionality over all list commands
function Get-List { ls }
New-Alias -Name ll -Value Get-List
New-Alias -Name l -Value Get-List

# Git status for the lazy me
function gitstatus { git status }
New-Alias -Name gs -Value gitstatus

# "gl" existed but i've deleted because its basicly pwd
# This is Git log for lazy me
remove-item alias:gl -Force
function gitlog { git log }
New-Alias -Name gl -Value gitlog

# One short command for pushing to current branch
function push-currentbranch {
    $currentBranch = git rev-parse --abbrev-ref HEAD
    git push origin $currentBranch
}
New-Alias -Name push -Value push-currentbranch

# Same with as above but pulling instead
function pull-currentbranch {
    $currentBranch = git rev-parse --abbrev-ref HEAD
    git pull origin $currentBranch
}
New-Alias -Name pull -Value pull-currentbranch

# Get to my testing dir right awat
function playground {
    cd C:\Users\oleg.lindvin\Documents\Projects\playground
}
New-Alias -Name play -Value playground

# Open exporer
function open-files { explorer.exe $args }
New-Alias -Name open -Value open-files

# New powershell instance
function powershell-new {
    & "C:\Users\oleg.lindvin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell.lnk"
}

New-Alias -Name new -Value powershell-new

function pdx_pegasus {
    & "D:\tools\pdx_pegasus\windows\pdx_pegasus.exe" $args 
}
New-Alias -Name pegasus -Value pdx_pegasus


function open-config { code $profile }
New-Alias -Name config -Value open-config

# Restard Powershell Session from whithin the session
# Credit https://communary.net/2015/05/28/how-to-reload-the-powershell-console-session/ 
function Invoke-PowerShell {
    powershell -nologo
    Invoke-PowerShell
}

function Restart-PowerShell {
    if ($host.Name -eq 'ConsoleHost') {
        exit
    }
    Write-Warning 'Only usable while in the PowerShell console host'
}

Set-Alias -Name 'rs' -Value Restart-PowerShell

$parentProcessId = (Get-WmiObject Win32_Process -Filter "ProcessId=$PID").ParentProcessId
$parentProcessName = (Get-WmiObject Win32_Process -Filter "ProcessId=$parentProcessId").ProcessName

if ($host.Name -eq 'ConsoleHost') {
    if (-not($parentProcessName -eq 'powershell.exe')) {
        Invoke-PowerShell
    }
}

# Some flavour of fun
figlet -f epic -w 100 "Lets do some CODING <3 <3"


