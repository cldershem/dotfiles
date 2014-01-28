#!/usr/bin/env python
import subprocess
import os.path


home_dir = '/home/cldershem/'

dots = [
    'zshrc',
    'vim',
    'vimrc',
    'tmux',
    'tmux.conf',
    'bashrc',
    'gitconfig',
    'zshrc',
    'oh-my-zsh'
    ]

new_dots = [
    'vim ~/.vim',
    'vim/vimrc ~/.vimrc',
    'tmux ~/.tmux',
    'basrc ~/.bashrc',
    'git/gitconfig ~/.gitconfig',
    'zsh/zshrc ~/.zshrc',
    'zsh/oh-my-zsh ~/.oh-my-zsh',
    'zsh/cameron.zsh-theme ~/.oh-my-zsh/themes'
    ]

apt_depends = [
    'git',
    'vim',
    'tmux',
    'zsh'
    ]

pip_depends = [
    'virtualenvwrapper',
    'flake8'
    ]


def get_dependancies():
    for depend in apt_depends:
        command = 'sudo apt-get install {}'.format(depend)
        subprocess.call(command.split())
        print("Installed {}").format(depend)
    for depend in pip_depends:
        command = 'pip install {}'.format(depend)
        print("Installed {}").format(depend)


def get_submodules():
    command = 'git submodule update --init'
    subprocess.call(command.split())
    print("Initialized submodules")


def mv_old_dots():
    command = 'mkdir ~/.dotfiles.old'
    subprocess.call(command.split())

    for dot in dots:
        old_dot = ('{}{}').format(home_dir, dot)
        if os.path.exists(old_dot):
            dot = '~/.{}'.format(dot)
            command = 'mv {} ~/.dotfiles.old'.format(dot)
            subprocess.call(command.split())
            print("Moved {}").format(dot)
        else:
            print("{} doesn't exist.").format(dot)
    print("You can rm ~/.dotfiles.old when you're good.")


def ln_new_dots():
    for dot in new_dots:
        dot = dot.replace('~/', home_dir)
        command = 'ln -s {}'.format(dot)
        subprocess.call(command.split())
        print("Linked {}").format(dot)


def update_sh():
    command = 'chsh -s /bin/zsh'
    subprocess.call(command.split())
    print("Changed sh to zsh")


if __name__ == '__main__':
    get_dependancies()
    get_submodules()
    mv_old_dots()
    ln_new_dots()
    update_sh()