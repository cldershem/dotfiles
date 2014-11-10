install: apt-deps pip-deps get-submodules \
	update-sh mv-dots ln-dots install-fonts install-ycm


apt-deps:
	sudo apt-get -y install openssh-server
	sudo apt-get -y install git
	sudo apt-get -y install vim
	sudo apt-get -y install tmux
	sudo apt-get -y install zsh
	sudo apt-get -y install python-pip
	sudo apt-get -y install python-dev
	sudo apt-get -y install silversearcher-ag
	sudo apt-get -y install ipython

pip-deps:
	sudo pip install virtualenvwrapper
	sudo pip install flake8

install-ycm: get-submodules
	sudo apt-get -y install build-essential
	sudo apt-get -y install cmake
	cd ~/.vim/bundle/YouCompleteMe && \
		git submodule update --init --recursive && \
		./install.sh --clang-completer

get-submodules:
	cd ~/.dotfiles && \
		git submodule update --init

install-fonts:
	mkdir -p ~/.fonts/ && \
		wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf \
		> ~/.fonts/PowerlineSymbols.otf
	mkdir -p ~/.config/fontconfig/conf.d && \
		wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf \
		> ~/.config/fontconfig/conf.d/10-powerline-symbols.conf
	# # fc-cache -vf ~/.fonts

update-sh:
	chsh -s /bin/zsh

mv-dots:
	mkdir -p ~/.olddots
	if [ -d "~/.vim" ]; then \
		mv ~/.vim ~/.olddots/.vim; \
		fi
	if [ -f "~/.vimrc" ]; then \
		mv ~/.vimrc ~/.olddots/.vimrc; \
		fi
	if [ -f "~/.tmux.conf" ]; then \
		mv ~/.tmux.conf ~/.olddots/.tmux.conf; \
		fi
	if [ -f "~/.gitconfig" ]; then \
		mv ~/.gitconfig ~/.olddots/.gitconfig; \
		fi
	if [ -f "~/.zshrc" ]; then \
		mv ~/.zshrc ~/.olddots/.zshrc; \
		fi
	if [ -f "~/.bashrc" ]; then \
		mv ~/.bashrc ~/.olddots/.bashrc; \
		fi
	if [ -d "~/.oh-my-zsh" ]; then \
		mv ~/.oh-my-zsh ~/.olddots/.oh-my-zsh; \
		fi

ln-dots:
	ln -s ~/.dotfiles/vim ~/.vim
	ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
	ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
	ln -s ~/.dotfiles/bashrc ~/.bashrc
	ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
	ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
	ln -s ~/.dotfiles/zsh/oh-my-zsh ~/.oh-my-zsh
	ln -s ~/.dotfiles/zsh/cameron.zsh-theme ~/.oh-my-zsh/themes
