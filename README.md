Installation:
--------------
```
sudo apt-get install git vim tmux zsh
git clone git@github.com:cldershem/dotfiles.git ~/.dotfiles
```

If powerline:
```
pip install --user git+git://github.com/Lokaltog/powerline
ln -s ~/.dotfiles/powerline ~/.config/powerline
```
- possibly need some fonts:
    - https://powerline.readthedocs.org/en/latest/installation/linux.html#installation-linux

If zsh:
```
cd ~/.dotfiles
git submodule add git://github.com/robbyrussell/oh-my-zsh.git ./zsh/oh-my-zsh
chsh -s /bin/zsh
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/oh-my-zsh ~/.oh-my-zsh
ln -s ~/.dotfiles/zsh/cameron.zsh-theme ~/.oh-my-zsh/themes 
```

Create symlinks:
```
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
ln -s ~/.dotfiles/tmux ~/.tmux
ln -s ~/.dotfiles/bashrc ~/.bashrc 
```

Switch to the ~/.vim directory, and fetch submodules:
```
cd ~/.dotfiles
git submodule update --init
```

Install flake8
(in system python, not venv)
```
sudo pip install flake8
```

Use:
------
Add new plugins to pathogen
```
cd ~/.dotfiles
git submodule add git://path.to/plugin vim/bundle/plugin
```

if trouble
```
git rm --cached ~/vim/bundle/plugin
```
or better yet just rm the plugin and add it properly next time


References
------------
- http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
