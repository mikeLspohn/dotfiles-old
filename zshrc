export ZSH=$HOME/.oh-my-zsh # Path to installation
ZSH_THEME="gitster"          # Found in ~/.oh-my-zsh/themes

export UPDATE_ZSH_DAYS=1   # Ask for update everyday

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails npm bundler) # Plugins found in ~/.oh-my-zsh/plugins/

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
alias watch-git-status="watch -n1 -c git -c color.ui=always status"

#######################################
#   PATH AND ENVIRONMENT VARIABLES    #
#######################################
#
eval $(opam config env)

# Load nvm
export NVM_DIR="/Users/michael/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  

export PATH="/usr/local/bin:/usr/Cellar/bin/git:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/michael/bin:/Users/michael/bin:$GOROOT/bin:$PATH:$HOME/.rvm/bin/$PATH:$HOME/Library/Android/sdk/platform-tools"
export GEM_PATH="/Users/michael/.rvm/bin" # Add RVM to PATH for scripting
export GOPATH=/Users/$USER/go
export PATH=$GOPATH/bin:$PATH

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
