Installation:
--------------
```
git clone git@github.com:cldershem/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
python ./install.py
```
```
sudo apt-get install git vim tmux zsh
pip install virtualenvwrapper flake8
git clone git@github.com:cldershem/dotfiles.git ~/.dotfiles
```

- possibly need some fonts for vim-airline:
    - https://powerline.readthedocs.org/en/latest/installation/linux.html#installation-linux

Change sh to zsh:
```
chsh -s /bin/zsh
```

Fetch submodules:
```
cd ~/.dotfiles
git submodule update --init
```

Create symlinks:
```
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
ln -s ~/.dotfiles/tmux ~/.tmux
ln -s ~/.dotfiles/bashrc ~/.bashrc 
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/oh-my-zsh ~/.oh-my-zsh
ln -s ~/.dotfiles/zsh/cameron.zsh-theme ~/.oh-my-zsh/themes
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
