PS1="\w :. "

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

export CLICOLOR=1

alias ..="cd .."
alias l="ls -al"
alias ll="ls -al"
alias g="git"
alias gs="git status"
alias gl="git log"
alias gf="git fetch --all --prune"
alias vi="vim"
alias gb="git branch"

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig

export MAVEN_OPTS="-Xms512m -Xmx1024m"
