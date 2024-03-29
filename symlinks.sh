# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc tmux.conf vimrc vim zshrc oh-my-zsh"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
echo "Moving $files from ~/ to $olddir"

for file in $files; do
  # If existing file, move to ~/dotfiles_old
  if [ -d ~/.$file ]; then
    mv ~/.$file ~/dotfiles_old/
  fi

    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [ ! -d $dir/oh-my-zsh/ ]; then
        echo "Installing oh-my-zh"
        git clone http://github.com/robbyrussell/oh-my-zsh.git
        echo "Creating default .zshrc"
        cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [ ! $(echo $SHELL) == $(which zsh) ]; then
        echo "Setting ZSH as default shell!"
        chsh -s $(which zsh)
    else
      echo "ZSH is already set as your default shell."
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        sudo apt-get install zsh
        install_zsh
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        echo "I recommend using Homebrew for OSX package management."
        exit
    fi
fi
}

install_zsh
