# based on intheloop by James Smith (http://loopj.com)
# A multiline prompt with username, hostname, full path, return status, git branch, git dirty status, git remote status

# color vars
local my_pink="$FG[217]"
local my_green="$FG[034]"
local my_grey="$fg_bold[grey]"
local my_yellow="$fg[yellow]"
local my_magenta="$fg_bold[magenta]"

local host_color="${my_green}"
if [ -n "$SSH_CLIENT" ]; then
  local host_color="red"
fi

function venv_info {
    [ $VIRTUAL_ENV ] && echo "%{$FG[217]%}`basename $VIRTUAL_ENV`%{$reset_color%}"
    }

local return_status="%{$fg[blue]%}%(?..⏎)%{$reset_color%}"
local prompt_indicator="%{$FG[217]%}❯%{$reset_color%}"
local pipe_top="%{$FG[217]%}╭─%{$reset_color%}"
local pipe_bottom="%{$FG[217]%}╰─%{$reset_color%}"
local user_host=\
"%{$fg_bold[grey]%}[%{$reset_color%}%{${host_color}%}%n"\
"${my_pink}@${reset_color}"\
"${my_green}%m%{$reset_color%}%{$fg_bold[grey]%}]%{$reset_color%}"
local current_dir="%{$fg_bold[blue]%}%11c%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="${my_grey}(${my_pink}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="${my_grey}) ${my_yellow}±%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="${my_grey})"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="${my_yellow}↓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="${my_yellow}↑%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="${my_yellow}↕%{$reset_color%}"
MODE_INDICATOR="--NORMAL--"

PROMPT='
${pipe_top}${user_host} ${current_dir} $(git_prompt_info) $(git_remote_status)
${pipe_bottom}${prompt_indicator} '

RPROMPT='${return_status} $(vi_mode_prompt_info) $(venv_info)'
