#
#  88                               88
#  88                               88
#  88                               88
#  88,dPPYba,  ,adPPYYba, ,adPPYba, 88,dPPYba,  8b,dPPYba,  ,adPPYba,
#  88P'    "8a ""     `Y8 I8[    "" 88P'    "8a 88P'   "Y8 a8"     ""
#  88       d8 ,adPPPPP88  `"Y8ba,  88       88 88         8b
#  88b,   ,a8" 88,    ,88 aa    ]8I 88       88 88         "8a,   ,aa
#  8Y"Ybbd8"'  `"8bbdP"Y8 `"YbbdP"' 88       88 88          `"Ybbd8"'
#

[[ $- != *i* ]] && return

if cat /proc/version | grep -q 'microsoft'; then
	WSL=true
else
	WSL=false
fi

# Configure {{{
# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\n\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\n\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh
# }}}

# Alias {{{
alias free='free -m' # show sizes in MB
alias more=less
alias v='nvim'
alias ls='exa'
alias c='bat'
alias cp='rsync -avhW --no-compress --progress'
alias _='sudo'
alias ctl='sudo systemctl'
alias uctl='systemctl --user'
alias paci='sudo pacman --color=auto -S'
alias pacr='sudo pacman --color=auto -Rs'
alias pacu='sudo pacman --color=auto -Syu'
if [[ $WSL == true ]]; then
	alias yi='sudo apt install'
	alias yr='sudo apt --purge remove'
	alias yu='sudo apt update && sudo apt upgrade'
else
	alias yi='yay -S'
	alias yr='yay -R'
	alias yu='yay -Syu --devel --timeupdate'
fi
alias dockerc='docker images -f "dangling=true" -q | xargs --no-run-if-empty docker rmi -f'
alias e="edit.sh"
alias er="edit.sh /"
alias ed="edit.sh ."
alias eh="edit.sh ~"
alias live="less +F" # Live reload files
alias ss20="cd ~/Documents/h-da/ss20/"
alias tree="tre"

# WSL Specific {{{
if [[ $WSL == true ]]; then
	alias home="cd /mnt/c/Users/nluebker"
	alias helmfile="~/.local/bin/helmfile_linux_amd64"
	# alias rust-analyzer="rustup run nightly rust-analyzer"
fi
# }}}

# }}}

# Exports {{{
export PATH=$PATH:/home/nils/scripts:/home/nils/bin/DDNet-11.8-linux_x86_64/
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/home/nils/.gem/ruby/2.7.0/bin
export PATH=$PATH:/home/nils/.local/share/racket/7.9/bin
export GOPATH=$(go env GOPATH)
# export GOFLAGS="-mod=vendor"
export ALSA_CARD=G4M1
# Make java apps work with bspwm
export _JAVA_AWT_WM_NONREPARENTING=1
# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export EDITOR=nvim
export ES_HOME=/home/nils/Documents/tracing/elk/elasticsearch-7.10.1
export KIBANA_HOME=/home/nils/Documents/tracing/elk/kibana-7.10.1
export JAVA_HOME=/usr/lib/jvm/java-15-openjdk
export JAR=/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_1.6.0.v20200915-1508.jar
export GRADLE_HOME=/usr/share/java/gradle
export JDTLS_CONFIG=/usr/share/java/jdtls/config_linux
export WORKSPACE=/home/nils/.local/share/jdt-ls
# export DOCKER_HOST=ssh://nils@80.158.57.148:22
 export MANPAGER='nvim +Man!'
 # export MANWIDTH=999
# Proxy
if [[ $WSL == true ]]; then
	export HTTP_PROXY="http://HE112113.emea1.cds.t-internal.com:8080"
	export http_proxy="http://HE112113.emea1.cds.t-internal.com:8080"
	export HTTPS_PROXY="http://HE112113.emea1.cds.t-internal.com:8080"
	export https_proxy="http://HE112113.emea1.cds.t-internal.com:8080"
	export NO_PROXY="localhost,.t-internal.com,.telekom.de,.t-systems.com,.webex.com,10.0.0.0/8"
	export no_proxy="localhost,.t-internal.com,.telekom.de,.t-systems.com,.webex.com,10.0.0.0/8"
fi
# }}}

# Sources {{{
# source /home/nils/.oh-my-git/prompt.sh
source ~/.cargo/env
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# source /home/nils/.config/broot/launcher/bash/br
# }}}

# Misc {{{
xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# Unlimited history size
export HISTSIZE=
export HISTFILESIZE=
export HISTFILE=~/.bash_eternal_history
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Ignore duplicate commands
export HISTCONTROL=ignoreboth:erasedups



[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
# }}}

# Functions {{{

# Global {{{
termcolors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

average() {
	awk '{ total += $1; count++ } END { print total/count }' $1
}

cht ()
{
	curl cht.sh/$1
}

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar -xvf $1  ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Colorized man pages
man() {
	env \
		LESS_TERMCAP_mb=$'\e[1;31m' \
		LESS_TERMCAP_md=$'\e[1;31m' \
		LESS_TERMCAP_me=$'\e[0m' \
		LESS_TERMCAP_se=$'\e[0m' \
		LESS_TERMCAP_so=$'\e[1;44;33m' \
		LESS_TERMCAP_ue=$'\e[0m' \
		LESS_TERMCAP_us=$'\e[1;32m' \
			man "$@"
}
#}}}

# WSL {{{
if [[ $WSL == true ]]; then
       cdd() {
               ignore_options="--exclude 'vendor' \
                                               --exclude 'node_modules'"
               fzf_options="--height 40% --layout=reverse"
               cd $(fd . '/mnt/c/Users/nluebker/Dev' --type d $ignore_options | fzf $fzf_options)
       }
fi
#}}}

# }}}

# Direnv {{{
_direnv_hook() {
  local previous_exit_status=$?;
  trap -- '' SIGINT;
  eval "$("/usr/bin/direnv" export bash)";
  trap - SIGINT;
  return $previous_exit_status;
};
if ! [[ "${PROMPT_COMMAND:-}" =~ _direnv_hook ]]; then
  PROMPT_COMMAND="_direnv_hook${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
fi
# }}}

. "$HOME/.cargo/env"

# vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
