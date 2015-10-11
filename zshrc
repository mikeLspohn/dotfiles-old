# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="simple"

 export UPDATE_ZSH_DAYS=1
 export TERM=xterm-256color

# Uncomment the following line to disable auto-setting terminal title.
 DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm rails)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#####################################
#        ALIAS THAT SHIT            #
#####################################


alias editzsh='vim ~/dotfiles/zshrc'
alias editvimrc='vim ~/dotfiles/vimrc'
alias ga='git add'
alias gc='git commit'
alias gi='git init'
alias sql='/Applications/MAMP/Library/bin/mysql --host=localhost'


####################################
#         CUSTOM COMMANDS          #
####################################
#Make and change into directory
function mkcd() {
    mkdir $1
    cd $1
}


#######################################
#   PATH AND ENVIRONMENT VARIABLES    #
#######################################

# Load nvm
export NVM_DIR="/Users/michael/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  

export PATH="/usr/local/bin:/usr/Cellar/bin/git:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/michael/bin:/Users/michael/bin"
export GEM_PATH="/Users/michael/.rvm/bin" # Add RVM to PATH for scripting
export GOPATH="$HOME/gocode"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools
export PATH=$PATH:$HOME/code
