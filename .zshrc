##### ------------------------------------------------------------
##### 基本: chroot 表示と色プロンプト検出（従来のBash断片を尊重）
##### ------------------------------------------------------------

# set variable identifying the chroot you work in (used in the prompt below)
if [[ -z "${debian_chroot:-}" ]] && [[ -r /etc/debian_chroot ]]; then
  debian_chroot="$(< /etc/debian_chroot)"
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [[ -n "${force_color_prompt:-}" ]]; then
  if command -v tput >/dev/null 2>&1 && tput setaf 1 >/dev/null 2>&1; then
    # We have color support; assume it's compliant with Ecma-48 (ISO/IEC-6429).
    color_prompt=yes
  else
    color_prompt=
  fi
fi

##### ------------------------------------------------------------
##### エイリアス（一般）
##### ------------------------------------------------------------

alias ls='ls -G --color=auto'
alias ll='ls -la'
alias ltr='ls -ltra'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias d='cd ~/dotfiles'

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

##### ------------------------------------------------------------
##### ショートカット系エイリアス
##### ------------------------------------------------------------

alias vimrc='hx ~/.vimrc'
alias bashrc='hx ~/.bashrc'
alias .b='. ~/.bashrc'
alias sc='shellcheck'

##### ------------------------------------------------------------
##### Homebrew / GNUコマンド関連
##### ------------------------------------------------------------

# brew caskでインストールするソフトを/Applicationsに設定
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# brew がある場合は update/upgrade を実行（起動が重くなるので注意）
if command -v brew >/dev/null 2>&1; then
  cmd='brew update;'
  echo "$ ${cmd}"
  eval "${cmd}"

  cmd='brew upgrade;'
  echo "$ ${cmd}"
  eval "${cmd}"
fi

##### ------------------------------------------------------------
##### PATH / 言語系ツールチェーン
##### ------------------------------------------------------------

# 先頭に /usr/local/bin を確保
export PATH="/usr/local/bin:$PATH"

# Rust (rustup/cargo)
export PATH="$HOME/.cargo/bin:$PATH"
[[ -r "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# Node (nvm) - zshでもOKだが、bash用補完はzshでは読まない
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"   # This loads nvm
# 以下は bash 専用の補完。zshでは無効化（Bash起動時のみ有効にするガード）
if [[ -n "${BASH_VERSION-}" && -s "$NVM_DIR/bash_completion" ]]; then
  . "$NVM_DIR/bash_completion"
fi


alias grep='grep --color=auto'
export PKG_CONFIG_PATH='/usr/lib/x86_64-linux-gnu/pkgconfig'

# Rust 関係エイリアス
alias cb='cargo build'
alias cc='cargo clippy -- -W clippy::pedantic '
alias cf='cargo fmt'
alias cn='cargo new'
alias cr='cargo run'
alias cw='cargo-watch --poll -x fmt -x clippy -x run'

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fnm (Fast Node Manager) - $HOME ベースに修正
FNM_PATH="$HOME/.local/share/fnm"
if [[ -d "$FNM_PATH" ]]; then
  export PATH="$FNM_PATH:$PATH"
  if command -v fnm >/dev/null 2>&1; then
    eval "$(fnm env)"
  fi
fi

##### ------------------------------------------------------------
##### 追加ツールの初期化
##### ------------------------------------------------------------

# zoxide
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh --cmd cd)"
fi

# starship
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# wezterm 設定の編集ショートカット
alias vw='vi ~/.wezterm.lua'

# atuin
if command -v atuin >/dev/null 2>&1; then
  eval "$(atuin init zsh)"
fi

##### ------------------------------------------------------------
##### 最後に: PATH の重複を自動除去（zshの配列特性を活用）
##### ------------------------------------------------------------
# zsh では $path 配列と PATH 文字列が対応している。重複要素をユニーク化。
typeset -U path PATH

# 1) 環境変数・パスの設定（必要に応じて）
export EDITOR=hx                           # エディタ設定例（Neovimをデフォルトエディタに）
export ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompdump"  # 補完キャッシュ格納場所

# 2) プラグインマネージャの読み込み（今回は znap を使用）
source ~/zsh-snap/znap.zsh

# 3) プラグインとツールの初期化
# --- autosuggestions（履歴サジェスト）
znap source zsh-users/zsh-autosuggestions    # ★GitHub上のプラグインを自動取得＆読み込み
# --- syntax-highlighting（構文ハイライト）
znap source zsh-users/zsh-syntax-highlighting
# --- その他Zsh用プラグイン
znap source marlonrichert/zsh-autocomplete   # ★補完UI拡張（オプション、快適さ向上）
# --- Starshipプロンプト初期化
eval "$(starship init zsh)"                 # ★Starshipはbrew等でインストール済みと仮定
# --- zoxide初期化
eval "$(zoxide init zsh)"
# --- fzfシェル補完・キー設定の読み込み
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh      # ★fzfインストール時に配置されるスクリプト

# znap などプラグインの読み込みが終わった後に一度だけ
autoload -Uz compinit

mkdir -p "${ZSH_COMPDUMP:h}"

# 1回だけ、かつ安全性チェックは無視（-i）
compinit -i -d "$ZSH_COMPDUMP"

# 4) プロンプト等の仕上げ
export PROMPT='%B%F{cyan}%n@%m%f%b %1~ %# '   # （Starshipを使う場合このPROMPT設定は無視されます）

