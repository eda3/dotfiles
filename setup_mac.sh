#!/bin/bash

# xcodeのインストール
xcode-select --install

# Homebrewのインストール
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# GNU
brew install findutils --with-default-name

# プログラミング言語系
brew install go
brew install python@3.8
brew install ffmpeg
brew install awscli

# brew caskでのインストール
# 定番系
brew cask install alfred
brew cask install bettertouchtool
brew cask install google-japanese-ime
brew cask install iterm2
brew cask install hyper

# ブラウザ
brew cask install vivaldi

# エディタ
brew cask install pycharm
brew cask install visual-studio-code.
brew install cask macvim

# チャットツール
brew cask install discord
brew cask install slack

# オンラインストレージ
brew cask install dropbox
brew cask install box-sync
brew cask install google-backup-and-sync
brew cask install onedrive

# ディスク使用量視覚化
brew cask install disk-inventory-x

# masコマンドでAppStoreのソフトをインストール
brew install mas

# LINE
mas install 539883307
