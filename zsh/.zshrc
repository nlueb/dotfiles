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

# zmodload zsh/zprof

if [[ -f "$HOME/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
    source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
fi

if [[ -f "/proc/version" ]]; then
    if cat /proc/version | grep -q 'microsoft'; then
        WSL=true
    fi
else
    WSL=false
fi

# Settings {{{
# Allows you to enter dirs without typing cd
# https://zsh.sourceforge.io/Doc/Release/Options.html#Changing-Directories
setopt AUTO_CD

# Enable job control
# https://zsh.sourceforge.io/Doc/Release/Options.html#Job-Control
setopt MONITOR

# Enable command line editing in vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd V edit-command-line
bindkey \e vi-cmd-mode

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
export ZSH_AUTOSUGGEST_USE_ASYNC=1

# Custom completions
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi
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
alias ls='eza --icons'
alias c='bat'
# alias cp='rsync -avhW --no-compress --progress'
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
    alias yr='yay -Rns'
    alias yu='yay -Syu --devel --timeupdate'
fi

# Git
alias gc='git commit'
alias ga='git add'
alias gs='git status'
# alias gw='git worktree'

# WSL Specific {{{
if [[ $WSL == true ]]; then
    # alias rust-analyzer="rustup run nightly rust-analyzer"
fi
# }}}

# }}}

# Exports {{{
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:~/.local/bin
export GOPATH=$(go env GOPATH)
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
export CC=clang
export CXX=clang++
# enable passphrase prompt for gpg
export GPG_TTY=$(tty)
if [[ $WSL == true ]]; then
    export CLONE_PATH="/home/nils/MagentaCI"
    export CLONE_BARE="true"
    export GIT_TICKET_COMMIT_MSG_TYPE="prefix"
else
    export WLR_RENDERER=vulkan
fi
# }}}

# Sources {{{
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
eval "$(atuin init zsh)"
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

cht() {
    curl cht.sh/$1
}

#
# # ex - archive extractor
# # usage: ex <file>
ex() {
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

gw() {
    CLI_COMMAND="${1}"
    if [[ "${CLI_COMMAND}" == "switch" ]] || [[ "${CLI_COMMAND}" == "s" ]]; then
        if RESULT="$(get-or-create-worktree)"; then
            WORKTREE_PATH="${RESULT}"
            cd "${WORKTREE_PATH}"
        else
            ERROR_MSG="${RESULT}"
            echo "${ERROR_MSG}"
        fi
    elif [[ "${CLI_COMMAND}" == "remove" ]] || [[ "${CLI_COMMAND}" == "r" ]]; then
        find-and-remove-worktree
    elif [[ "${CLI_COMMAND}" == "create" ]] || [[ "${CLI_COMMAND}" == "c" ]]; then
        if RESULT="$(create-new-worktree "${@:2}")"; then
            WORKTREE_PATH="${RESULT}"
            cd "${WORKTREE_PATH}"
        else
            ERROR_MSG="${RESULT}"
            echo "${ERROR_MSG}"
        fi
    elif [[ "${CLI_COMMAND}" == "list" ]] || [[ "${CLI_COMMAND}" == "l" ]]; then
        git worktree list
    else
        echo 'Usage: gw [(s)witch|(r)emove|(c)reate]'
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
    cdp() {
        local search_root='/home/nils/MagentaCI/nils.luebker'
        local ignore_options=(--exclude 'vendor' --exclude 'node_modules')
        local fzf_options=(--height 40% --layout=reverse)
        local selected_dest="$(fd --type directory --unrestricted --absolute-path '\.bare$|\.git$' "${search_root}" --exec dirname {} | sed "s|^${search_root}/||" | fzf ${fzf_options})"
        if [[ -n "${selected_dest}" ]]; then
            cd "${search_root}/${selected_dest}"
            gw switch
        fi
    }
    cdb() {
        local search_root='/home/nils/MagentaCI/b2b-dtp'
        local fzf_options=(--height 40% --layout=reverse)
        local selected_dest="$(fd --type directory --unrestricted --absolute-path '\.bare$|\.git$' "${search_root}" --exec dirname {} | sed "s|^${search_root}/||" | fzf ${fzf_options})"
        if [[ -n "${selected_dest}" ]]; then
            cd "${search_root}/${selected_dest}"
            gw switch
        fi
    }
    cds() {
        local search_root='/home/nils/MagentaCI/service-area-gk'
        local fzf_options=(--height 40% --layout=reverse)
        local selected_dest="$(fd --type directory --unrestricted --absolute-path '\.bare$|\.git$' "${search_root}" --exec dirname {} | sed "s|^${search_root}/||" | fzf ${fzf_options})"
        if [[ -n "${selected_dest}" ]]; then
            cd "${search_root}/${selected_dest}"
            gw switch
        fi
    }
    cdm() {
        local search_root='/home/nils/MagentaCI/mbsp'
        local fzf_options=(--height 40% --layout=reverse)
        local selected_dest="$(fd --type directory --unrestricted --absolute-path '\.bare$|\.git$' "${search_root}" --exec dirname {} | sed "s|^${search_root}/||" | fzf ${fzf_options})"
        if [[ -n "${selected_dest}" ]]; then
            cd "${search_root}/${selected_dest}"
            gw switch
        fi
    }
    cdi() {
        local search_root='/home/nils/MagentaCI/innersource'
        local fzf_options=(--height 40% --layout=reverse)
        local selected_dest="$(fd --type directory --unrestricted --absolute-path '\.bare$|\.git$' "${search_root}" --exec dirname {} | sed "s|^${search_root}/||" | fzf ${fzf_options})"
        if [[ -n "${selected_dest}" ]]; then
            cd "${search_root}/${selected_dest}"
            gw switch
        fi
    }
    cdc() {
        local git_root="$(git rev-parse --show-toplevel)"
        local fzf_options=(--height 40% --layout=reverse)
        local selected_dest="$(fd --type file gitlab.env "${git_root}" --exec dirname {} | sed "s|^${git_root}/||" | fzf "${fzf_options[@]}")"
        if [[ -n "${selected_dest}" ]]; then
            cd "${git_root}/${selected_dest}"
        fi
    }
    cdd() {
        local git_root="$(git rev-parse --show-toplevel)"
        local fzf_options=(--height 40% --layout=reverse)
        local selected_dest="$(fd . --type directory "${git_root}" | sed "s|^${git_root}/||" | fzf "${fzf_options[@]}")"
        if [[ -n "${selected_dest}" ]]; then
            cd "${git_root}/${selected_dest}"
        fi
    }
    cdr() {
        local git_root="$(git rev-parse --show-toplevel)"
        if [[ -n "${git_root}" ]]; then
            cd "${git_root}"
        fi
    }
else
    cdd() {
        ignore_options=(--exclude 'vendor' --exclude 'node_modules')
        fzf_options=(--height 40% --layout=reverse)
        cd $(fd . --type d ${ignore_options} '/home/nils/Documents' | fzf ${fzf_options})
    }
    zvm_config() {
        ZVM_VI_SURROUND_BINDKEY="s-prefix"
        ZVM_SYSTEM_CLIPBOARD_ENABLED=true
    }
fi
#}}}

# }}}

# Plugins {{{
zinit ice wait lucid
zinit light zsh-users/zsh-completions

zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid
zinit light zsh-users/zsh-syntax-highlighting

zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
# }}}

# zprof

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

## vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
