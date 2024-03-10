# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

shopt -s expand_aliases
alias ls='ls -G --color=auto'
alias ll="ls -la"
alias ltr="ls -ltra"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias d="cd ~/dotfiles"

# git関連エイリアス
alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gb='git branch'
alias gl='git log --oneline --decorate --graph --branches --tags --remotes --name-status -5'
alias gla='git log --oneline --decorate --graph --branches --tags --remotes --name-status'
alias gp='git push'
alias gs='git status'
alias gss='git status -s'
alias gf='git diff'
alias gff='git diff --word-diff '
alias gfs='git diff --staged'
alias gcom='git commit -m '
alias gco='git commit '
alias gb='git branch'

# rails関連エイリアス
alias rt='rails test'
alias rs='rails server'
alias rc='rails console'

# python関係
alias python='python3'
alias py='python3'
alias pip='pip3'
alias .ve='. ./venv/bin/activate'


# =========== プロンプト変更 ===============
# 参考【Bash】ターミナルのプロンプトのカスタマイズ方法まとめ - Qiita https://qiita.com/hmmrjn/items/60d2a64c9e5bf7c0fe60
# Gitブランチ名を表示
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
# source ~/.git-prompt.sh

# PS1="\W \$ "

# Gitブランチの状況を*+%で表示
# GIT_PS1_SHOWDIRTYSTATE=true
# GIT_PS1_SHOWUNTRACKEDFILES=true
# GIT_PS1_SHOWSTASHSTATE=true
# GIT_PS1_SHOWUPSTREAM=auto

# 出力の後に改行を入れる
# function add_line {
  # if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    # PS1_NEWLINE_LOGIN=true
  # else
    # printf '\n'
  # fi
# }
# PROMPT_COMMAND='add_line'

# if [ "$(uname)" == "Linux" ]; then
#     OS="Linux"
#     eval $(~/.linuxbrew/bin/brew shellenv)
# else
#    OS="Mac"
#    # brew dockerの警告文削除用
#    alias brew="env PATH=${PATH/\/Users\/${USER}\/\.pyenv\/shims:/} brew"
#fi


# ターミナル入力ショートカット系
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias .b='. ~/.bashrc'
alias e='~/Dropbox/Documents/python_english_words_20190117/src/english_words.py'
alias cdhugo="cd ~/Dropbox/hugo"
alias cdhg="cd ~/Dropbox/hugo"
alias hg="cd ~/Dropbox/hugo"
alias dot="cd ~/Dropbox/Dotfiles"
alias vkara="code ~/.config/karabiner/karabiner.json"
alias sc="shellcheck"

# python.jpの検索をコマンド指定
p() { open "https://www.google.co.jp/search?domains=python.jp&sitesearch=python.jp&sourceid=google-search&q=$*"; }

# brew caskでインストールするソフトを/Applicationsに設定
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# GNU系コマンド
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"

# brew install gitしたとき用
export PATH="/usr/local/opt/gettext/bin:$PATH"

export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"


if type brew >/dev/null 2>&1; then
  cmd="brew update;"
  echo "$ ${cmd}"
  eval "${cmd}"

  cmd="brew upgrade;"
  echo "$ ${cmd}"
  eval "${cmd}"
fi



# rustup
export PATH="${PATH}:${HOME}/.cargo/bin"export PATH="/usr/local/bin:$PATH"
. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source "$HOME/.cargo/env"


# uclip
PATH="/mnt/c/Users/shoda/uclip.exe:$PATH"


alias grep="grep --color=auto"
export PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig"



# Rust関係
alias cb="cargo build"
alias cc="cargo clippy"
alias cf="cargo fmt"
alias cn="cargo new"
alias cr="cargo run"
alias cw="cargo-watch --poll -x fmt -x clippy -x run"

alias idea='/mnt/c/Program\ Files/JetBrains/RustRover\ 233.11799.306/bin/rustrover64.exe'

cd ~

