#
#                       88
#                       88
#                       88
# 888888888  ,adPPYba,  88,dPPYba,   8b,dPPYba,   ,adPPYba,
#      a8P"  I8[    ""  88P'    "8a  88P'   "Y8  a8"     ""
#   ,d8P'     `"Y8ba,   88       88  88          8b
# ,d8"       aa    ]8I  88       88  88          "8a,   ,aa
# 888888888  `"YbbdP"'  88       88  88           `"Ybbd8"'
#

source ~/.zplug/init.zsh

if cat /proc/version | grep -q 'microsoft'; then
    WSL=true
else
    WSL=false
fi

# Plugins {{{
zplug "zplug/zplug", hook-build:"zplug --self-manage"

# Prompt
zplug mafredri/zsh-async, from:github
# zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# ZSH Users
zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"
# }}}

# Settings {{{
# Allows you to enter dirs without typing cd
# https://zsh.sourceforge.io/Doc/Release/Options.html#Changing-Directories
setopt AUTO_CD

# Enable job control
# https://zsh.sourceforge.io/Doc/Release/Options.html#Job-Control
setopt MONITOR

# Custom completions
fpath+=~/.zfunc
compinit
# }}}

# History {{{
export HISTFILE=~/.zsh_history
export SAVEHIST=1000000000
export HISTFILESIZE=$SAVEHIST
export HISTSIZE=$SAVEHIST

# Add history immediately
setopt INC_APPEND_HISTORY

# Ignore duplicates
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS

# Remove blanks
setopt HIST_REDUCE_BLANKS

# Enable History
setopt SHARE_HISTORY
# }}}

# Alias {{{
alias v='nvim'
alias ls='exa --icons'
alias c='bat'
alias cp='rsync -avhW --no-compress --progress'
alias tree="tre"
alias htop="gotop"
alias _='sudo'
alias ctl='sudo systemctl'
alias uctl='systemctl --user'
if [[ $WSL == true ]]; then
    alias yi='sudo apt install'
    alias yr='sudo apt --purge remove'
    alias yu='sudo apt update && sudo apt upgrade && sudo apt full-upgrade'
else
    alias yi='yay -S'
    alias yr='yay -R'
    alias yu='yay -Syu --devel --timeupdate'
fi

# Git
alias gc='git commit'
alias ga='git add'
alias gs='git status'
alias gw='git worktree'

# WSL Specific {{{
if [[ $WSL == true ]]; then
    alias home="cd /mnt/c/Users/nluebker"
    alias fd="fdfind"
    # alias rust-analyzer="rustup run nightly rust-analyzer"
fi
# }}}

# }}}

# Exports {{{
export PATH=$PATH:/home/nils/scripts:/home/nils/bin/DDNet-11.8-linux_x86_64/
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.local/nvim/bin
export PATH=$PATH:/home/nils/.gem/ruby/2.7.0/bin
export PATH=$PATH:/home/nils/.local/share/racket/7.9/bin
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export GOPATH=$(go env GOPATH)
export EDITOR=nvim
export MANPAGER='nvim +Man!'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:#363636,bg:-1,hl:#636363,fg+:#363636,bg+:-1,hl+:#C586C0
--color=info:#C586C0,prompt:#C586C0,pointer:#C586C0,marker:#D7BA7D,spinner:#C586C0
--info=inline
--prompt="󱎸 "
--pointer=""
--marker=""
'
export EXA_ICON_SPACING=2
export XDG_CURRENT_DESKTOP="X-Generic"
# enable passphrase prompt for gpg
export GPG_TTY=$(tty)
if [[ $WSL == true ]]; then
    export HTTP_PROXY="http://sia-lb.telekom.de:8080"
    export http_proxy="http://sia-lb.telekom.de:8080"
    export HTTPS_PROXY="http://sia-lb.telekom.de:8080"
    export https_proxy="http://sia-lb.telekom.de:8080"
    export NO_PROXY="localhost,.t-internal.com,.telekom.de,.webex.com,10.0.0.0/8"
    export no_proxy="localhost,.t-internal.com,.telekom.de,.webex.com,10.0.0.0/8"
    export PATH="$PATH:/mnt/c/Program Files/Win32Yank"
    export PATH="$PATH:/home/nils/go/bin"
    export CLONE_PATH="/home/nils/MagentaCI"
    export CLONE_BARE="true"
    # Copy from: https://dev.to/bowmanjd/using-podman-on-windows-subsystem-for-linux-wsl-58ji
    # Without systemd, the $XDG_RUNTIME_DIR was not available for podman to use for temporary files.
    # This script checks if the $XDG_RUNTIME_DIR is set, and, if not, sets it to the default systemd
    # location (/run/user/$UID). If that does not exist, then set and create a temporary directory
    # for the current user.
    if [[ -z "$XDG_RUNTIME_DIR" ]]; then
        export XDG_RUNTIME_DIR=/run/user/$UID
        if [[ ! -d "$XDG_RUNTIME_DIR" ]]; then
            export XDG_RUNTIME_DIR=/tmp/$USER-runtime
            if [[ ! -d "$XDG_RUNTIME_DIR" ]]; then
                mkdir -m 0700 "$XDG_RUNTIME_DIR"
            fi
        fi
    fi
fi
# }}}

# Sources {{{
source ~/.cargo/env
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"
eval "$(fnm env)"
eval "$(starship init zsh)"
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
# man() {
#     env \
#         LESS_TERMCAP_mb=$'\e[1;31m' \
#         LESS_TERMCAP_md=$'\e[1;31m' \
#         LESS_TERMCAP_me=$'\e[0m' \
#         LESS_TERMCAP_se=$'\e[0m' \
#         LESS_TERMCAP_so=$'\e[1;44;33m' \
#         LESS_TERMCAP_ue=$'\e[0m' \
#         LESS_TERMCAP_us=$'\e[1;32m' \
#         man "$@"
#     }
#}}}

# WSL {{{
if [[ $WSL == true ]]; then
    cdf() {
        ignore_options=(--exclude 'vendor' --exclude 'node_modules')
        fzf_options=(--height 40% --layout=reverse)
        cd $(fd . --type d ${ignore_options} '/home/nils/MagentaCI/future-diagnostics' | fzf ${fzf_options})
    }
    cdd() {
        ignore_options=(--exclude 'vendor' --exclude 'node_modules')
        fzf_options=(--height 40% --layout=reverse)
        cd $(fd . --type d ${ignore_options} '/home/nils/MagentaCI/vanya' | fzf ${fzf_options})
    }
else
    cdd() {
        ignore_options=(--exclude 'vendor' --exclude 'node_modules')
        fzf_options=(--height 40% --layout=reverse)
        cd $(fd . --type d ${ignore_options} '/home/nils/Documents' | fzf ${fzf_options})
    }
fi
#}}}

# }}}

# zplug {{{
# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi

zplug load
# }}}

alias luamake=/home/nils/Documents/lua/lua-language-server/3rd/luamake/luamake

# vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
