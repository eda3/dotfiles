shopt -s expand_aliases
alias ls='ls -G'
alias ll="ls -la"
alias ltr="ls -ltra"


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
source ~/.git-prompt.sh

PS1="\W \$ "

# Gitブランチの状況を*+%で表示
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# 出力の後に改行を入れる
function add_line {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}
PROMPT_COMMAND='add_line'

if [ "$(uname)" == "Linux" ]; then
    OS="Linux"
    eval $(~/.linuxbrew/bin/brew shellenv)
else
    OS="Mac"
    # brew dockerの警告文削除用
    alias brew="env PATH=${PATH/\/Users\/${USER}\/\.pyenv\/shims:/} brew"
fi


# gitignore テンプレート
function __gi {
  curl -L -s https://www.gitignore.io/api/$@ >> ./.gitignore
}

alias gi=__gi

# golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# hub alias
eval "$(hub alias -s)"

# ターミナル入力ショートカット系
alias vimrc='vim ~/.vimrc'
alias .b='. ~/.bashrc'
alias .v='. ~/.bashrc'
alias vv="open /Applications/Vivaldi.app"
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

cmd="brew update;"
echo "$ ${cmd}"
eval "${cmd}"

cmd="brew upgrade;"
echo "$ ${cmd}"
eval "${cmd}"
