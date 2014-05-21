Installation:
--------------
```
git clone git@github.com:cldershem/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
python ./install.py
```

Use:
------
Add new plugins to pathogen
```
cd ~/.dotfiles
git submodule add git://path.to/plugin vim/bundle/plugin
update install.py
```

Don't for get to set up your ssh keys for git.
https://help.github.com/articles/generating-ssh-keys
May need `eval "$(ssh-agent)"`
 
if trouble
```
git rm --cached ~/.vim/bundle/plugin
```
or better yet just rm the plugin and add it properly next time


References
------------
- http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
