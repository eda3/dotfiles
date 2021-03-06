from keyhac import *


def configure(keymap):
    keymap.editor = r"/usr/local/Cellar/macvim/8.1-161/MacVim.app"

    # Global keymap which affects any windows
    keymap_global = keymap.defineWindowKeymap()

    # =================================================
    # BetterTouchTools用の設定
    # =================================================
    # F18(Code:79) -> タブを閉じるなど
    keymap_global["(79)"] = "LCmd-W"

    # F16(Code106) -> 左のタブへ移動など
    keymap_global["(106)"] = "LCtrl-Shift-TAB"

    # F17(Code:64) -> 右のタブへ移動など
    keymap_global["(64)"] = "Ctrl-TAB"

    # =================================================
    # 左Ctrlキー押下時
    # =================================================
    # カーソルの移動
    keymap_global["LCtrl-A"] = "D-Cmd", "Left", "U-Cmd"
    keymap_global["LCtrl-Shift-A"] = "D-Cmd", "D-Shift", "Left", "U-Cmd", "U-Shift"
    keymap_global["LCtrl-E"] = "D-Cmd", "Right", "U-Cmd"
    keymap_global["LCtrl-Shift-E"] = "D-Cmd", "D-Shift", "Right", "U-Cmd", "U-Shift"
    keymap_global["LCtrl-F"] = "Right"
    keymap_global["LCtrl-B"] = "Left"
    keymap_global["LCtrl-P"] = "Up"
    keymap_global["LCtrl-N"] = "Down"
    keymap_global["LCtrl-Shift-F"] = "Shift-Right"
    keymap_global["LCtrl-Shift-B"] = "Shift-Left"
    keymap_global["LCtrl-Shift-P"] = "Shift-Up"
    keymap_global["LCtrl-Shift-N"] = "Shift-Down"

    # 検索
    keymap_global["LCtrl-S"] = "Cmd-F", "U-Cmd", "U-Shift"

    # 改行
    keymap_global["LCtrl-M"] = "Enter"
    keymap_global["LCtrl-J"] = "Enter"

    # 削除
    keymap_global["LCtrl-H"] = "D-Shift", "U-Shift", "back", "U-ctrl", "U-Shift"
    keymap_global["LCtrl-D"] = "delete", "U-Ctrl", "U-Shift"

    # カット
    keymap_global["LCtrl-K"] = (
        "D-Shift",
        "D-Cmd",
        "Right",
        "U-Shift",
        "LCmD-x",
        "U-Shift",
        "U-Cmd",
    )
    keymap_global["LCtrl-W"] = "Cmd-X", "U-Cmd"

    # TAB
    keymap_global["LCtrl-I"] = "TAB"

    # 左Ctrlキーの一部のCmdキー代わりにする
    # CtrlとCmdを入れ替えない理由は右CmdはCmdとして使いたいため
    keymap_global["LCtrl-C"] = "Cmd-C", "U-Cmd"
    keymap_global["LCtrl-L"] = "Cmd-L", "U-Cmd"
    keymap_global["LCtrl-T"] = "Cmd-T", "U-Cmd"
    keymap_global["LCtrl-V"] = "Cmd-V", "U-Cmd"
    keymap_global["LCtrl-Z"] = "Cmd-Z", "U-Cmd"

    # 0-9はCtrlキーを使用
    for i in range(9):
        i = str(i)
        keymap_global["LCtrl-" + i] = "Cmd-" + i, "U-Cmd"

    # =================================================
    # 左Cmdキー押下時
    # =================================================
    # iTermなどでCtrl + Cを使えるようにするため
    # keymap_global["LCmd-C"] = "Ctrl-C", "U-Ctrl"

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

    # =================================================
    # かなキー(104)押下時
    # =================================================
    keymap.defineModifier("104", "User1")
    # かな単独 : IME-ON
    keymap_global["O-(104)"] = "104"

    # かな + HJKL : ←↑↓→
    keymap_global["User1-H"] = "Left"
    keymap_global["User1-J"] = "Down"
    keymap_global["User1-K"] = "Up"
    keymap_global["User1-L"] = "Right"
    keymap_global["User1-Shift-H"] = "Shift-Left"
    keymap_global["User1-Shift-J"] = "Shift-Down"
    keymap_global["User1-Shift-K"] = "Shift-Up"
    keymap_global["User1-Shift-L"] = "Shift-Right"
    keymap_global["User1-Shift-Ctrl-H"] = "Shift-Cmd-Left", "U-Shift", "U-Cmd"
    keymap_global["User1-Shift-Ctrl-J"] = "Shift-Cmd-Down", "U-Shift", "U-Cmd"
    keymap_global["User1-Shift-Ctrl-K"] = "Shift-Cmd-Up", "U-Shift", "U-Cmd"
    keymap_global["User1-Shift-Ctrl-L"] = "Shift-Cmd-Right", "U-Shift", "U-Cmd"

    # かな + ; -> Enter
    keymap_global["User1-Semicolon"] = "Enter"

    # =================================================
    # その他
    # =================================================

    # ¥(93) : `(バッククォート)
    keymap_global["(93)"] = "BackQuote"

    # Shift + ¥(93) : ~(チルダ)
    keymap_global["Shift-(93)"] = "Shift-BackQuote"

    # :(コロン)と;(セミコロン)を入れ替え
    # Vim使ったりPython書いたりするときに便利なため
    keymap_global["Semicolon"] = "Shift-Semicolon"
    keymap_global["Shift-Semicolon"] = "Semicolon"

    # '(シングルクォート)と"(ダブルクォート)を入れ替え
    # 基本的に引用符はダブルクォートしか使わないため
    keymap_global["Quote"] = "Shift-Quote"
    keymap_global["Shift-Quote"] = "Quote"
