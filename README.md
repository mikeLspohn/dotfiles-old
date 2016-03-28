# Personal Dotfiles

These are my personal dotfiles.
This is primarily tests on OSX. Linux is in the works :)

**WARNING: Installs zsh and oh-my-zsh if not already installed**
**Also sets your default shell to zsh. DONT INSTALL IF YOU DON'T WANT THIS**

During installing, if you didnt' already have oh-my-zsh and zsh installed it will
create a new zshrc file from the oh-my-zsh default template. My personal zshrc file
is in $HOME/dotfiles/zshrc. I didn't symlink this one by default again because 
path variables and other zsh config might change between systems, and I haven't
ironed out how to deal with any issues yet.

> Inspired by many, used by one (for now)

## Installation
**_There's still some bugs in the script, but it's almost there. Use at your own risk ;)_**

1. Clone or fork the repo:
  - `git clone https://github.com/mikeLspohn/dotfiles.git`
2. Run the install script
  - `cd dotfiles`
  - Run the script from directory root: `./install.sh`

##TODO
1. Make sure Vundle gets installed when during install script run
2. vimrc may need some work to check for term colors depending on terminal
3. Leave message to restart shell after install
4. Leave documenation for other things that may need installed (homebrew, sudo, etc.)
5. More testing for install.sh on fresh linux and osx systems
