if status is-interactive
    # Commands to run in interactive sessions can go here
end

#### ALIASES

# TMUX
alias ctmux="TERM=screen-256color-bce tmux"
alias ta="ctmux attach"
alias tnew="ctmux new -s"

# GIT
alias g="git"
alias gc="g commit"
alias glg="g log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gst="g status"
alias gp="g push"
alias gps="gp --set-upstream"
alias gpo="gp origin"
alias gpso="g push --set-upstream origin"
alias ga="g add"
alias todo="vim ~/.todos"

# NVIM
alias vim="nvim"

# Hub
eval "$(hub alias -s fish)"

# ibrew? (added by foundryup)
alias ibrew='arch -x86_64 /usr/local/bin/brew'


#### EXPORTS

# PATH
set -gx PATH /opt/homebrew/bin /usr/local/opt/python/libexec/bin /opt/local/bin /opt/local/sbin /usr/bin /bin /usr/sbin /sbin /usr/local/sbin /usr/local/bin $PATH

# Cargo
set -gx PATH $PATH $HOME/.cargo/bin

# Node
set -gx NODE_PATH "/usr/local/lib/node"

# Editors
set -gx EDITOR nvim
set -gx GIT_EDITOR nvim

# MISC
set -gx TSC_NONPOLLING_WATCHER 1

# Load secrets
source $HOME/.secrets
