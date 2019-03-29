Import-Module posh-git
Import-Module oh-my-posh

Set-Theme Avit

$DefaultUser = 'olli'

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

# Some flavour of fun
figlet -f epic -w 100 "Lets do some CODING <3 <3"
