export ZSH=$HOME/.oh-my-zsh # Path to installation
ZSH_THEME="gitster"          # Found in ~/.oh-my-zsh/themes

export UPDATE_ZSH_DAYS=1   # Ask for update everyday
export TERM=xterm-256color # Use 256color for iTerm2

# Uncomment the following line to disable auto-setting terminal title.
 DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails npm bundler warhol) # Plugins found in ~/.oh-my-zsh/plugins/

source $ZSH/oh-my-zsh.sh

# Use vim for local and ssh sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

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
alias sql='/Applications/MAMP/Library/bin/mysql --host=localhost'
alias watch-git-status="watch -n1 -c git -c color.ui=always status"
alias apply-gitignore='git ls-files -ci --exclude-standard -z | xargs -0 git rm --cached'
alias rspec='nocorrect rspec' # messing with vim-test shit

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

# TODO: Probably needs cleaned up
# User stuff, go bin path, rvm path, android platform tools path
export GOROOT="/usr/local/go" #go install from brew I think?
export GOPATH="$HOME/gocode"
export PATH="/usr/local/bin:/usr/Cellar/bin/git:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/michael/bin:/Users/michael/bin:$GOROOT/bin:$PATH:$HOME/.rvm/bin/$PATH:$HOME/Library/Android/sdk/platform-tools"
export GEM_PATH="/Users/michael/.rvm/bin" # Add RVM to PATH for scripting
# export SSL_CERT_FILE="/usr/local/etc/openssl/cert.pem" #not sure if I need this?


#######################################
#    LOAD NODE VERSION FROM NVMRC     #
#######################################
nvm_switch_if_needed() {
  local NVM_RC_VERSION
  local REAL_VERSION
  read NVM_RC_VERSION < $(nvm_find_nvmrc)
  REAL_VERSION=$(nvm_version $NVM_RC_VERSION)
  nvm use
}

# Call script when changing directories and on terminal ready
nvm_switch_if_needed
cd() {builtin cd "$@"; time nvm_switch_if_needed; }

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
