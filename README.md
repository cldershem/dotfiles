Installation:
--------------
```
git clone git@github.com:cldershem/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
python ./install.py
```
- possibly need some fonts for vim-airline:
    - https://powerline.readthedocs.org/en/latest/installation/linux.html#installation-linux

YouCompleteMe
-------------
```
cd ~/.vim/bundle/YouCompleteMe
git submodule --init --recursive (er something)
./install.sh
```
may need to set flags for C languages

Use:
------
Add new plugins to pathogen
```
cd ~/.dotfiles
git submodule add git://path.to/plugin vim/bundle/plugin
```

if trouble
```
git rm --cached ~/.vim/bundle/plugin
```
or better yet just rm the plugin and add it properly next time


References
------------
- http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
