Installation:
--------------
'''
git clone git://github.com/cldershem/dotvim.git ~/.vim
git clone git://github.com/cldershem/dotfiles ~/.dotfiles
'''

Create symlinks:
'''
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
'''

Switch to the ~/.vim directory, and fetch submodules:
'''
cd ~/.vim
git submodule init
git submodule update
'''

'''
cd ~/.vim
git rm --cached ~/.vim/bundle/plugin
git submodule add git://path.to/plugin
'''

'''
git submodule add git://path.to/plugin ~/.vim/bundle/
'''


- references
    - http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
