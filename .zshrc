# https://stackoverflow.com/questions/26462667/git-completion-not-working-in-zsh-on-os-x-yosemite-with-homebrew
fpath=(~/.zsh/completions $fpath) 
autoload -U compinit && compinit
zmodload -i zsh/complist

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="hmind"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Example aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias tmux="TERM=screen-256color-bce tmux"
alias ta="tmux attach"
alias tnew="tmux new -s"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler gem stugov 15122)

export GOPATH=~/go

export GITHUB_ACCESS_TOKEN="cb42eec6cd4057aa62d0f488771d314fd84d0fa5"

# Customize to your needs...
export PATH=/usr/local/opt/python/libexec/bin:/usr/texbin:~/scala/bin/:~/code/go/bin:/opt/local/bin:/opt/local/sbin:/Users/hmind/cc0/bin:/usr/local/git/bin:/Users/hmind/.rvm/gems/ruby-1.9.2-p290/bin:/Users/hmind/.rvm/gems/ruby-1.9.2-p290@global/bin:/Users/hmind/.rvm/rubies/ruby-1.9.2-p290/bin:/Users/hmind/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/texbin:~/sdk/platform-tools:$GOPATH/bin:~/depot_tools:~/code/moz-git-tools:~/code/arc/arcanist/bin:/usr/local/cuda/bin:$PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
export PATH=/usr/local/git/bin:/user/local/share/npm/bin:$PATH
export NODE_PATH="/usr/local/lib/node"
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-6.5/lib:$DYLD_LIBRARY_PATH

# This needs to be *after* hub is loaded or *before* it is aliased, or git_compare_version errors on load
source $ZSH/oh-my-zsh.sh

eval "$(hub alias -s)"

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

##
# Your previous /Users/hmind/.bash_profile file was backed up as /Users/hmind/.bash_profile.macports-saved_2011-08-04_at_11:32:04
##

# MacPorts Installer addition on 2011-08-04_at_11:32:04: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:~/cc0/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

PATH="/usr/texbin:~/scala/bin/:${PATH}"
export PATH

export ORACLE_HOME=~/oracle/instantclient
export ORACLE_BASE=~/oracle/instantclient
export LD_LIBRARY_PATH=~/oracle/instantclient

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# added by travis gem
[ -f /Users/mozilla/.travis/travis.sh ] && source /Users/mozilla/.travis/travis.sh

# OPAM configuration
. /Users/mozilla/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $HOME/software/z.sh

