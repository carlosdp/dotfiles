# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="hmind"

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
plugins=(git bundler gem stugov 15122)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/texbin:~/scala/bin/:/opt/local/bin:/opt/local/sbin:/Users/hmind/cc0/bin:/usr/local/git/bin:/Users/hmind/.rvm/gems/ruby-1.9.2-p290/bin:/Users/hmind/.rvm/gems/ruby-1.9.2-p290@global/bin:/Users/hmind/.rvm/rubies/ruby-1.9.2-p290/bin:/Users/hmind/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/texbin
export PATH=~/cc0/bin:$PATH
alias mate='open -a TextMate.app'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
export PATH=/usr/local/git/bin:/user/local/share/npm/bin:$PATH
export NODE_PATH="/usr/local/lib/node"

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
