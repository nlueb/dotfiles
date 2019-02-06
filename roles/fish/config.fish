#powerline-daemon -q
set -x TERM screen-256color
set -x PATH /usr/local/Cellar/elasticsearch@2.4/2.4.6/bin /Library/Developer/CommandLineTools/usr/bin ~/.local/bin ~/scripts ~/.cargo/bin /usr/local/opt/qt/bin $PATH
set -x RUST_SRC_PATH /Users/nils/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src
set -x FZF_DEFAULT_OPTS "--height 40% --reverse --prompt=\"  \" --color=dark,fg:246,hl:12,bg+:246,fg+:234,hl+:160,pointer:234,prompt:2"
# set PAGER most
# set MANPAGER most
#set fish_function_path $fish_function_path "~/.local/bin/powerline/bindings/fish"
#powerline-setup
# alias ls="colorls"
# Fish Vim Mode
set fish_key_bindings fish_vi_key_bindings

set -g git_extra_info 0
alias c="ccat"
alias cat="ccat"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias openssl="/usr/local/opt/openssl/bin/openssl"
alias man="man -P most"
alias ls="exa"
alias la="exa -a"
alias ll="exa -gl --git"
alias al="exa -gla --git"
alias makefile="cp ~/scripts/Makefile ./"
alias makefileqt="cp ~/scripts/MakefileQT ./; mv MakefileQT Makefile"

echo -en "\033]6;1;bg;red;brightness;40\a"
echo -en "\033]6;1;bg;green;brightness;42\a"
echo -en "\033]6;1;bg;blue;brightness;54\a"
