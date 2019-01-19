alias ls='ls -G'
alias ll="ls -la"
alias ltr="ls -ltra"

alias vimrc='vim ~/.vimrc'

alias .b='. ~/.bashrc'
alias .v='. ~/.bashrc'


# git関連エイリアス
alias g='git'
alias gaa='git add -A'
alias gb='git branch'
alias gl='git log --oneline --decorate --graph --branches --tags --remotes --name-status -5'
alias gla='git log --oneline --decorate --graph --branches --tags --remotes --name-status'
alias gp='git push'
alias gs='git status'
alias gss='git status -s'
alias gf='git diff'
alias gff='git diff --word-diff '
alias gcom='git commit -m '
alias gco='git commit '
alias gb='git branch'

# rails関連エイリアス
alias rt='rails test'
alias rs='rails server'
alias rc='rails console'

# python関係
# export PYENV_ROOT=$HOME/.pyenv
# export PATH=$PYENV_ROOT/bin:$PATH
# eval "$(pyenv init -)"

alias python='python3'
alias py='python3'
alias pip='pip3'

# プロンプト変更
#PS1="\W $ "
PS1="eda: $ "

# brew dockerの警告文削除用
alias brew="env PATH=${PATH/\/Users\/${USER}\/\.pyenv\/shims:/} brew"

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
