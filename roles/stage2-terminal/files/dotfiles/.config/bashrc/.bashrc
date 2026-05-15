#!/bin/bash
# shellcheck disable=SC1090,SC1091
#--- Interactive shells only --------------------------------------------------
# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac
# set variable identifying the chroot you work in (used in the prompt below)
if [ "${debian_chroot:-}" = "" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi
#--- Prompt -------------------------------------------------------------------
if [[ -f ~/.config/bashrc/.bashrc_colors ]]; then
	source ~/.config/bashrc/.bashrc_colors
fi
if [[ -f ~/.config/bashrc/.bashrc_distro ]]; then
	source ~/.config/bashrc/.bashrc_colors
fi
if [[ -f ~/.config/bashrc/.bashrc_prompt ]]; then
	source ~/.config/bashrc/.bashrc_prompt
fi
#--- History ------------------------------------------------------------------
HISTSIZE=99999
HISTFILESIZE=99999
HISTFILE=~/.config/bashrc/.bash_history
HISTCONTROL=ignoreboth # don't put duplicate lines in the history.
shopt -s histappend    # append to the history file, don't overwrite it
shopt -s checkwinsize  # update the values of LINES and COLUMNS.
#--- Aliases ------------------------------------------------------------------
ALIASDIR_COMMON="/etc/bash_aliases.d"
if [[ -d "$ALIASDIR_COMMON" ]]; then
	for file in "$ALIASDIR_COMMON"/.bashrc_alias_*; do
		[[ -e "$file" ]] || continue # handle no matches
		source "$file"
	done
fi
if [[ -f ~/.config/bashrc/.bashrc_alias_custom ]]; then
	source ~/.config/bashrc/.bashrc_alias_custom
fi
#--- Bash completion ----------------------------------------------------------
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi
#--- Path Variable -----------------------------------------------------
if [[ ! -d "$HOME/.local/bin" ]]; then
	mkdir -p "$HOME/.local/bin"
fi
export PATH=$PATH:~/.local/bin
#--- Environment Variable -----------------------------------------------------
export EDITOR=vim
export LOCALESTR=en_US.UTF-8
export SHELL=/bin/bash
export SYSTEMD_PAGER="cat"
export LC_ALL="$LOCALESTR"
export LC_LANG="$LOCALESTR"
export LANG="$LOCALESTR"
export LANGUAGE="$LOCALESTR"
export XDG_CONFIG_HOME=$HOME/.config
export SUDO_ASKPASS=/usr/bin/ssh-askpass
export SSH_ASKPASS=/usr/bin/ssh-askpass
export GDK_DPI_SCALE=1
export GDK_SCALE=1
export QT_FONT_DPI=144
export QT_SCALE_FACTOR=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_ENABLE_HIGHDPI_SCALING=1
# export TERM=xterm-kitty
# export DISPLAY=:0
#--- Zoxide --------------------------------------------------------------------
eval "$(zoxide init bash)"
#--- Cargo ---------------------------------------------------------------------
if [[ -f "$HOME/.cargo/env" ]]; then
	. "$HOME/.cargo/env"
fi

#--- opencode ------------------------------------------------------------------
if [[ -f "$HOME"/.opencode/bin/opencode ]]; then
	export PATH="$HOME"/.opencode/bin:$PATH
fi
#--- fzf -----------------------------------------------------------------------
export FZF_DEFAULT_OPTS="
    --height=80%
    --layout=reverse
    --tmux 70%
    --inline-info
    --prompt='❯ '
    --pointer='▶'
    --marker='✓'
    --preview='batcat --color=always {}'
    --bind 'alt-p:toggle-preview'
"
