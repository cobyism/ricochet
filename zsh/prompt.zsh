function collapse_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  hg root >/dev/null 2>/dev/null && echo '☿' && return
	echo '➜'
}

function battery_charge {
  echo `$BAT_CHARGE` 2>/dev/null
}

function virtualenv_info {
  [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function rbenv_version {
  echo `rbenv version | cut -f 1 -d " "`
}

function collapse_user {
  echo $($USER | sed -e "s,^coby,,")
}

function collapse_hostname {
  echo $(hostname -s | sed -e "s,^Vulcan,,")
}

PROMPT='
%{$fg_bold[red]%}$(collapse_pwd)%{$reset_color%}$(hg_prompt_info)$(git_prompt_info)
$(virtualenv_info)$(prompt_char) '

RPROMPT='%{$fg[red]%}$(rbenv_version)%{$reset_color%}'
#RPROMPT=''

ZSH_THEME_GIT_PROMPT_PREFIX=" ⌥ %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} •"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%} •"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} •"
