install: apt-deps pip-deps get-submodules \
	install=fonts update-sh ln-dots install-ycm


apt-deps:
	apt-get install git
	apt-get install vim
	apt-get install tmux
	apt-get install zsh
	apt-get install python-pip
	apt-get install python-dev
	apt-get install silversearcher-ag

pip-deps:
	pip install virtualenvwrapper
	pip install flake8

install-ycm: get-submodules
	apt-get install build-essential
	apt-get install cmake
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

ln-dots:
	ln -s ./vim ~/.vim
	ln -s ./vim/vimrc ~/.vimrc
	ln -s ./tmux/tmux.conf ~/.tmux.conf
	ln -s ./bashrc ~/.bashrc
	ln -s ./git/gitconfig ~/.gitconfig
	ln -s ./zsh/zshrc ~/.zshrc
	ln -s ./zsh/oh-my-zsh ~/.oh-my-zsh
	ln -s ./zsh/cameron.zsh-theme ~/.oh-my-zsh/themes
