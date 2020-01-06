import time
import sys
import os.path
import re

from keyhac import *
from keyhac_keymap import *
from keyhac_hook import *


def configure(keymap):
    keymap.editor = r"C:\Users\user\AppData\Local\Programs\Microsoft VS Code\Code.exe"

    # Global keymap which affects any windows
    keymap_global = keymap.defineWindowKeymap()

    # 以下、キー操作の置き換え定義
    # Ctrl-?の最後にU-Ctrlがあるのは、Ctrl-?の連続操作が効かなくなる問題への対策
    # カーソルの移動
    keymap_global["LC-A"] = "Home", "U-Ctrl", "U-S"
    keymap_global["LC-Shift-A"] = "D-Shift", "Home", "U-Shift", "U-Ctrl", "U-S"
    keymap_global["LC-E"] = "End", "U-Ctrl", "U-S"
    keymap_global["LC-Shift-E"] = "D-Shift", "End", "U-Shift", "U-Ctrl", "U-S"
    keymap_global["LC-F"] = "Right", "U-Ctrl", "U-S"
    keymap_global["LC-B"] = "Left", "U-Ctrl", "U-S"
    keymap_global["LC-P"] = "Up", "U-Ctrl", "U-S"
    keymap_global["LC-N"] = "Down", "U-Ctrl", "U-S"

    # 検索
    keymap_global["LC-S"] = "Ctrl-F", "U-Ctrl", "U-S"

    # 改行
    keymap_global["Ctrl-M"] = "Enter", "U-Ctrl", "U-S"
    keymap_global["Ctrl-J"] = "Enter", "U-Ctrl", "U-S"

    # 削除
    # Ctrl-HのShiftキー押し・放しはOneNoteでCtrl-Hが機能しないことがある問題への対策
    keymap_global["LC-H"] = "D-Shift", "U-Shift", "Back", "U-Ctrl", "U-S"
    keymap_global["LC-D"] = "Delete", "U-Ctrl", "U-S"

    # 範囲選択・カット・コピー・ペースト・スクロール
    keymap_global["LC-K"] = "D-Shift", "End", "U-Shift", "LC-X", "U-Ctrl", "U-S"
    keymap_global["LC-W"] = "U-Shift", "Ctrl-X", "U-Ctrl", "U-S"

    # かな切替
    keymap_global["LC-O"] = "D-(244)", "U-(244)", "U-S"

    # Esc
    # keymap_global["LC-OpenBracket"] = "Esc"

    # TAB
    keymap_global["LC-I"] = "TAB", "U-Ctrl", "U-S"

    # =================================================
    # Xキー押下後の動作
    # =================================================
    keymap_global["LC-X"] = keymap.defineMultiStrokeKeymap("C-X")
    # 保存

    keymap_global["LC-X"]["LC-S"] = "LC-S", "U-C"

    # タブを閉じる等
    keymap_global["LC-X"]["LC-W"] = "LC-W", "U-C"

    # アプリを閉じる
    keymap_global["LC-X"]["LC-C"] = "LA-F4", "U-A"

    # =================================================
    # US配列変換
    # =================================================
    # @
    keymap_global["S-2"] = "Atmark"

    # ^
    keymap_global["S-6"] = "Caret"

    # &
    keymap_global["S-7"] = "S-6"

    # *
    keymap_global["S-8"] = "S-Asterisk"

    # (
    keymap_global["S-9"] = "S-8"

    # )
    keymap_global["S-0"] = "S-9"

    # _
    keymap_global["S-Minus"] = "LS-BackSlash"

    # =
    keymap_global["Caret"] = "S-Minus"
    keymap_global["C-Caret"] = "C-Add"

    # +
    keymap_global["S-Caret"] = "Add"
    keymap_global["C-S-Caret"] = "C-S-Add"

    # `
    keymap_global["Yen"] = "S-Atmark"

    # ~
    keymap_global["S-Yen"] = "S-Caret"
    # :
    keymap_global["S-Semicolon"] = "Colon"
    keymap_global["C-Semicolon"] = "C-Colon"
    # '
    keymap_global["Colon"] = "S-Quote"
    keymap_global["C-Colon"] = "C-S-Quote"

    # "
    keymap_global["S-Colon"] = "S-2"

    # [
    keymap_global["Atmark"] = "OpenBracket"
    keymap_global["C-Atmark"] = "C-OpenBracket"

    # ]
    keymap_global["OpenBracket"] = "CloseBracket"
    keymap_global["C-OpenBracket"] = "C-CloseBracket"

    # {
    keymap_global["S-Atmark"] = "S-OpenBracket"

    # }
    keymap_global["S-OpenBracket"] = "S-CloseBracket"

    keymap_global["CloseBracket"] = "Yen"
    keymap_global["S-CloseBracket"] = "S-Yen"
