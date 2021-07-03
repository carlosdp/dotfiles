# https://stackoverflow.com/questions/26462667/git-completion-not-working-in-zsh-on-os-x-yosemite-with-homebrew
fpath=(~/.zsh/completions $fpath) 
autoload -U compinit && compinit
zmodload -i zsh/complist

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

function collapse_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

setopt PROMPT_SUBST
PROMPT='%{$fg[magenta]%}%n%{$reset_color%} %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%} '

# Example aliases
alias tmux="TERM=screen-256color-bce tmux"
alias ta="tmux attach"
alias tnew="tmux new -s"

export GOPATH=~/go

# Customize to your needs...
export PATH=/usr/local/opt/python/libexec/bin:/usr/texbin:~/scala/bin/:~/code/go/bin:/opt/local/bin:/opt/local/sbin:/Users/hmind/cc0/bin:/usr/local/git/bin:/Users/hmind/.rvm/gems/ruby-1.9.2-p290/bin:/Users/hmind/.rvm/gems/ruby-1.9.2-p290@global/bin:/Users/hmind/.rvm/rubies/ruby-1.9.2-p290/bin:/Users/hmind/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/bin:/usr/X11/bin:/usr/texbin:~/sdk/platform-tools:$GOPATH/bin:~/depot_tools:~/code/moz-git-tools:~/code/arc/arcanist/bin:/usr/local/cuda/bin:$PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
export PATH=/usr/local/git/bin:/user/local/share/npm/bin:$PATH
export PATH=$PATH:$HOME/.cargo/bin
export NODE_PATH="/usr/local/lib/node"

export ANDROID_SDK_ROOT=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:"/opt/gradle-5.4.1/bin"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

eval "$(hub alias -s zsh)"

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

alias vim="nvim"

case `uname` in
  Darwin)
    # commands for OS X go here
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ;;
  Linux)
    # commands for Linux go here
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    export PATH=~/squashfs-root/usr/bin:$PATH
  ;;
esac

# open() {
#   setsid nohup xdg-open $1 > /dev/null 2> /dev/null
# }

# alias pbcopy='xclip -selection clipboard'
# alias pbpaste='xclip -selection clipboard -o'

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH
export PATH=$PATH:/Applications/Julia-1.2.app/Contents/Resources/julia/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/
# Helps with tsc --watch CPU usage
export TSC_NONPOLLING_WATCHER=1

if [[ -a ~/.zshrc-local ]]; then
  source ~/.zshrc-local
fi

if [[ -a ~/.secrets ]]; then
  source ~/.secrets
fi
