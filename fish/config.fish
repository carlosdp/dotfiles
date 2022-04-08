if status is-interactive
    # Commands to run in interactive sessions can go here
end

#### ALIASES

# TMUX
alias tmux="TERM=screen-256color-bce tmux"
alias ta="tmux attach"
alias tnew="tmux new -s"

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
set PATH /opt/homebrew/bin /usr/local/opt/python/libexec/bin /opt/local/bin /opt/local/sbin /usr/bin /bin /usr/sbin /sbin /usr/local/sbin /usr/local/bin $PATH

# Cargo
set PATH $PATH $HOME/.cargo/bin

# Node
set NODE_PATH "/usr/local/lib/node"

# Editors
set EDITOR nvim
set GIT_EDITOR nvim

# MISC
set TSC_NONPOLLING_WATCHER 1

# Load secrets
source $HOME/.secrets
