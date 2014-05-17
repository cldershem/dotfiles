Installation:
--------------
```
git clone git@github.com:cldershem/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
python ./install.py
```
- possibly need some fonts for vim-airline:
    - https://powerline.readthedocs.org/en/latest/installation/linux.html#installation-linux
    - wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
    mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
    fc-cache -vf ~/.fonts
    mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

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
