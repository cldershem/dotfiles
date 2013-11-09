Installation:
--------------
```
git clone git@github.com:cldershem/dotfiles.git ~/.dotfiles
```

Create symlinks:
```
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
ln -s ~/.dotfiles/tmux ~/.tmux
ln -s ~/.dotfiles/bashrc ~/.bashrc
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
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
