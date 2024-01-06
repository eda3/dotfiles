#!/bin/bash

# dotfiles ディレクトリの絶対パスを取得
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# インストール対象の設定やツールのリスト
FILES_TO_INSTALL=(
    .vimrc
    .bashrc
    # 追加のファイルやディレクトリをここに追加
)

# ドットファイルのシンボリックリンクを作成
create_symlinks() {
    for file in "${FILES_TO_INSTALL[@]}"; do
        source_file="$DOTFILES_DIR/$file"
        target_file="$HOME/$file"

        # 既存のファイルがある場合はバックアップを作成
        if [ -e "$target_file" ]; then
            mv "$target_file" "$target_file.bak"
            echo "Backup created: $target_file.bak"
        fi

        # シンボリックリンクを作成
        ln -s "$source_file" "$target_file"
        echo "Symlink created: $target_file -> $source_file"
    done
}

# インストール対象の設定やツールのインストール処理を追加
install_dependencies() {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

}

# 実際のインストール処理を実行
create_symlinks
install_dependencies

# gitの初期処理
git config --global user.email "gerorin1010@gmail.com"
git config --global user.name "eda3"

echo "Installation completed."
