import sys
import os
import datetime
import subprocess

from keyhac import *


def configure(keymap):
    # Global keymap which affects any windows
    keymap.editor = r"/usr/local/Cellar/macvim/8.1-161/MacVim.app"

    # カーソルの移動
    keymap_global = keymap.defineWindowKeymap()
    keymap_global["LCtrl-A"] = "D-Cmd", "Left", "U-Cmd"
    keymap_global["LCtrl-Shift-A"] = "D-Cmd", "D-Shift", "Left", "U-Cmd", "U-Shift"
    keymap_global["LCtrl-E"] = "D-Cmd", "Right", "U-Cmd"
    keymap_global["LCtrl-Shift-E"] = "D-Cmd", "D-Shift", "Right", "U-Cmd", "U-Shift"
    keymap_global["LCtrl-F"] = "Right"
    keymap_global["LCtrl-B"] = "Left"
    keymap_global["LCtrl-P"] = "Up"
    keymap_global["LCtrl-N"] = "Down"

    # 検索
    keymap_global["LCtrl-S"] = "Cmd-F", "U-Cmd", "U-Shift"

    # 改行
    keymap_global["LCtrl-M"] = "enter"
    keymap_global["LCtrl-J"] = "enter"

    # 削除
    keymap_global["LCtrl-H"] = "D-Shift", "U-Shift", "back", "U-ctrl", "U-Shift"
    keymap_global["LCtrl-D"] = "delete", "U-Ctrl", "U-Shift"

    # 範囲選択・カット・コピー・ペースト・スクロール
    keymap_global["LCtrl-K"] = (
        "D-Shift",
        "D-Cmd",
        "Right",
        "U-Shift",
        "LCmD-x",
        "U-ctrl",
        "U-Shift",
    )

    # TAB
    keymap_global["LCtrl-I"] = "TAB"

    # =================================================
    # Xキー押下後の動作
    # =================================================
    keymap_global["LCtrl-X"] = keymap.defineMultiStrokeKeymap("LCtrl-X")

    # 保存
    keymap_global["LCtrl-X"]["LCtrl-S"] = "Cmd-S", "U-Cmd"

    # アプリを閉じる
    keymap_global["LCtrl-X"]["LCtrl-C"] = "Cmd-W", "U-Cmd"

    # =================================================
    # 英数キー(102)押下時
    # =================================================
    keymap.defineModifier("102", "User0")
    # 英数単独 : IME-OFF
    keymap_global["O-(102)"] = "102"

    # 英数 + N : +
    keymap_global["User0-N"] = "Add"
    # 英数 + M : -
    keymap_global["User0-M"] = "Minus"
    # 英数 + H : *
    keymap_global["User0-H"] = "D-Shift", "Asterisk", "U-Shift"
    # 英数 + J : /
    keymap_global["User0-J"] = "slash"
