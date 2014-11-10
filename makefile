install: install-prereqs install-git install-vim setup-python \
	install-tmux install-zsh get-submodules install-ycm install-fonts \
	update-bashrc update-sh

install-prereqs:
	sudo apt-get -y install openssh-server
	sudo apt-get -y install silversearcher-ag

install-git:
	sudo apt-get -y install git
	rm -rf ~/.gitconfig
	ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig

install-vim:
	mkdir -p ~/.olddots
	if [ -d "~/.vim" ]; then \
		mv ~/.vim ~/.olddots/.vim; \
		fi
	if [ -f "~/.vimrc" ]; then \
		mv ~/.vimrc ~/.olddots/.vimrc; \
		fi
	mv ~/.dotfiles/vim ~/.vim
	mv ~/.dotfiles/.vimrc ~/.vimrc

setup-python:
	sudo apt-get -y install python-dev
	sudo apt-get -y install python-pip
	sudo pip install virtualenvwrapper
	sudo pip install flake8
	sudo apt-get -y install ipython

install-tmux:
	sudo apt-get -y install tmux
	ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf

get-submodules:
	cd ~/.dotfiles && \
		git submodule update --init

install-zsh: get-submodules
	sudo apt-get -y install zsh
	ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
	ln -s ~/.dotfiles/zsh/oh-my-zsh ~/.oh-my-zsh
	ln -s ~/.dotfiles/zsh/cameron.zsh-theme ~/.oh-my-zsh/themes

install-ycm: install-vim
	sudo apt-get -y install build-essential
	sudo apt-get -y install cmake
	cd ~/.vim/bundle/YouCompleteMe && \
		git submodule update --init --recursive && \
		./install.sh --clang-completer

install-fonts: install-vim
	mkdir -p ~/.fonts/ && \
		wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf \
		> ~/.fonts/PowerlineSymbols.otf
	mkdir -p ~/.config/fontconfig/conf.d && \
		wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf \
		> ~/.config/fontconfig/conf.d/10-powerline-symbols.conf
	# # fc-cache -vf ~/.fonts

update-sh: install-zsh
	chsh -s /bin/zsh

update-bashrc: update-sh
	mkdir -p ~/.olddots
	if [ -f "~/.bashrc" ]; then \
		mv ~/.bashrc ~/.olddots/.bashrc; \
		fi
	if [ -f "~/bashrc" ]; then \
		mv ~/.bashrc ~/.olddots/.bashrc; \
		fi
	ln -s ~/.dotfiles/bashrc ~/.bashrc
