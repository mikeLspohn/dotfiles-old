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
plugins=(git rails npm)

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
#       Custom Keybindings          #
#####################################
bindkey -v #vim mode!

#####################################
#        ALIAS THAT SHIT            #
#####################################

alias editzsh='vim ~/dotfiles/zshrc'
alias editvimrc='vim ~/dotfiles/vimrc'
alias ga='git add'
alias gc='git commit'
alias gi='git init'
alias gst='git status'
alias watch-git-status="watch -n1 -c git -c color.ui=always status"
alias apply-gitignore='git ls-files -ci --exclude-standard -z | xargs -0 git rm --cached'

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

