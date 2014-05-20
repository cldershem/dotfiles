install: apt-deps pip-deps get-submodules \
	update-sh mv-dots ln-dots install-fonts install-ycm


apt-deps:
	sudo apt-get install openssh-server
	sudo apt-get install git
	sudo apt-get install vim
	sudo apt-get install tmux
	sudo apt-get install zsh
	sudo apt-get install python-pip
	sudo apt-get install python-dev
	sudo apt-get install silversearcher-ag

pip-deps:
	sudo pip install virtualenvwrapper
	sudo pip install flake8

install-ycm: get-submodules
	sudo apt-get install build-essential
	sudo apt-get install cmake
	cd ~/.vim/bundle/YouCompleteMe && \
		git submodule update --init --recursive && \
		./install.sh --clang-completer

get-submodules:
	git submodule update --init

install-fonts:
	wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
	wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
	mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
	fc-cache -vf ~/.fonts
	mkdir -p ~/.config/fontconfig/conf.d/  && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

update-sh:
	chsh -s /bin/zsh

mv-dots:
	mkdir -p ~/.olddots
	if [ -d "~/.vim" ]; then \
		mv ~/.vim ~/.olddots/.vim; \
		fi
	if [ -a "~/.vimrc" ]; then \
		mv ~/.vimrc ~/.olddots/.vimrc; \
		fi
	if [ -a "~/.tmux.conf" ]; then \
		mv ~/.tmux.conf ~/.olddots/.tmux.conf; \
		fi
	if [ -a "~/.gitconfig" ]; then \
		mv ~/.gitconfig ~/.olddots/.gitconfig; \
		fi
	if [ -a "~/.zshrc" ]; then \
		mv ~/.zshrc ~/.olddots/.zshrc; \
		fi
	if [ -a "~/.bashrc" ]; then \
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
