#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
cameron.zsh-theme.py
~~~~~~~~~~~~~~~~~

description

:copyright: (c) 2016 by Cameron Dershem.
:license: see TOPMATTER
:source: github.com/cldershem/repo
"""
import os
import socket
import argparse


RESET_COLORS = '\033[01;32m'
yellow = '\033[01;33m'


def color(color, text):
    # TODO: fix colors
    colors = {
        'pink': '217',
        'green': '034',
        'grey': '241',
        'yellow': 'yellow',
        'magenta': '$fg_bold[magenta]',
        'red': 'red',
        'blue': '117',
    }

    color = '%F{' + colors[color] + '}'
    reset = '%f'
    return "{}{}{}".format(color, text, reset)


def user_hostname():
    host_color = 'green'

    if os.environ.get('SSH_CLIENT'):
        host_color = 'red'

    if os.environ.get('USER') == 'cldershem':
        # top_hat = '\N{TOP HAT}'
        # user = color(host_color, 'me')
        # ogre = '\N{JAPANESE OGRE}'
        man_w_gua_pi_mao = '\N{MAN WITH GUA PI MAO}'
        # lion = '\N{LION FACE}'
        # confetti = '\N{CONFETTI BALL}'
        # user = (color('pink', top_hat) + ' ' +
        #         color('pink', lion) + ' ')
        user = (color('pink', man_w_gua_pi_mao))
        # user = color('pink', top_hat) + ' ' + color('pink', confetti) + ' '
    else:
        user = color(host_color, os.environ.get('USER'))

    if socket.gethostname() == 'cldershem-xps' or socket.gethostname() == 'cldershem-xps13':
        house = '\N{HOUSE WITH GARDEN}'
        # host = color(host_color, 'home')
        host = color(host_color, house)
    else:
        host = color(host_color, socket.gethostname())

    left_sym = color('grey', '[')
    right_sym = color('grey', ']')
    seperator = color('grey', '@')

    return '{}{} {}{} {}'.format(left_sym, user, seperator, host, right_sym)


def shorten_path(path):
    max_length = 50
    home = os.path.expanduser('~')

    if path.startswith(home):
        path = path.replace(home, '~')

    # path = path.split(os.sep)
    # new_path = os.sep.join(path)

    if len(path) > max_length:
        path = path.split(os.sep)
        last_item = path[-1]
        new_path = ''
        for directory in path:
            if directory == last_item:
                new_path = os.path.join(new_path, directory)
            else:
                new_path = os.path.join(new_path, directory[0])
        return new_path
    else:
        return path


def current_dir():
    # https://gist.github.com/seanh/5233082
    try:
        try:
            cwd = os.getcwdu()
        except AttributeError:
            cwd = os.getcwd()
    except OSError as e:
        if e.errno == 2:
            # User most probably deleted the directory, this happens when
            # removing files from Mercurial repos for example.
            cwd = "[not found]"
        else:
            raise
    return cwd


def git_prompt():
    return ''


def left_prompt():
    pipe_top = color('pink', '╭─')
    user_host = user_hostname()
    cur_dir = color('blue', shorten_path(current_dir()))

    return pipe_top + user_host + ' ' + cur_dir


def right_prompt():
    venv = os.environ.get('VIRTUAL_ENV')
    if venv:
        venv = os.path.basename(venv)
        venv = color('pink', venv)
    else:
        venv = ''

    return venv


def bottom_prompt():
    pipe_bottom = color('pink', '╰─')
    prompt_indicator = color('pink', '❯')

    return pipe_bottom + prompt_indicator + ' '

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('side',
                        choices=('left', 'right', 'bottom'),
                        help="Which side of the prompt? left, right, bottom?")

    args = parser.parse_args()
    if args.side == 'left':
        print(left_prompt())
    elif args.side == 'bottom':
        print(bottom_prompt())
    else:
        print(right_prompt())
