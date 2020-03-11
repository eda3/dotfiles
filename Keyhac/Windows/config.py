from keyhac import *
from keyhac_hook import *
from keyhac_keymap import *


def configure(keymap):
    # Global keymap which affects any windows
    keymap_global = keymap.defineWindowKeymap()

    # =================================================
    # 無変換キー(29)との組み合わせの動作
    # =================================================
    keymap.defineModifier("29", "User0")
    keymap_global["O-(29)"] = "(29)"

    # 無変換-HJKL -> Win-←↓↑→
    keymap_global["U0-H"] = "Win-Left"
    keymap_global["U0-J"] = "Win-Down"
    keymap_global["U0-K"] = "Win-Up"
    keymap_global["U0-L"] = "Win-Right"

    # 無変換 -> Left/Down/Up/Right : キーボードで擬似マウス 40pixel単位のカーソル移動
    keymap_global["U0-A"] = keymap.MouseMoveCommand(-40, 0)
    keymap_global["U0-S"] = keymap.MouseMoveCommand(0, 40)
    keymap_global["U0-W"] = keymap.MouseMoveCommand(0, -40)
    keymap_global["U0-D"] = keymap.MouseMoveCommand(40, 0)

    # =================================================
    # 変換キー(28)との組み合わせの動作
    # =================================================
    keymap.defineModifier("28", "U1")

    # 変換単押し -> IME-ON
    keymap_global["O-(28)"] = "(28)"

    # 変換-HJKL -> ←↓↑→
    keymap_global["U1-H"] = "Left"
    keymap_global["U1-J"] = "Down"
    keymap_global["U1-K"] = "Up"
    keymap_global["U1-L"] = "Right"

    # 変換-N -> PageDown
    keymap_global["U1-N"] = "PageDown"

    # 変換-P -> PageUp
    keymap_global["U1-P"] = "PageUp"

    # 変換-C-HJKL -> C - ←↓↑→
    keymap_global["U1-C-H"] = "C-Left", "U-C"
    keymap_global["U1-C-J"] = "C-Down", "U-C"
    keymap_global["U1-C-K"] = "C-Up", "U-C"
    keymap_global["U1-C-L"] = "C-Right", "U-C"

    # 変換-S-HJKL -> S - ←↓↑→
    keymap_global["U1-S-H"] = "S-Left", "U-S"
    keymap_global["U1-S-J"] = "S-Down", "U-S"
    keymap_global["U1-S-K"] = "S-Up", "U-S"
    keymap_global["U1-S-L"] = "S-Right", "U-S"

    # 変換-C-S-HJKL -> C-S - ←↓↑→
    keymap_global["U1-C-S-H"] = "C-S-Left", "U-C", "U-S"
    keymap_global["U1-C-S-J"] = "C-S-Down", "U-C", "U-S"
    keymap_global["U1-C-S-K"] = "C-S-Up", "U-C", "U-S"
    keymap_global["U1-C-S-L"] = "C-S-Right", "U-C", "U-S"

    # 変換-A,E -> Home, End
    keymap_global["U1-A"] = "Home"
    keymap_global["U1-E"] = "End"

    keymap_global["U1-C-A"] = "C-Home", "U-C"
    keymap_global["U1-C-E"] = "C-End", "U-C"

    keymap_global["U1-S-A"] = "S-Home", "U-S"
    keymap_global["U1-S-E"] = "S-End", "U-S"

    keymap_global["U1-C-S-A"] = "C-S-Home", "U-C", "U-S"
    keymap_global["U1-C-S-E"] = "C-S-End", "U-C", "U-S"

    # 変換-N,P -> PageDown, PageUp
    keymap_global["U1-N"] = "PageDown"
    keymap_global["U1-P"] = "PageUp"

    keymap_global["U1-C-N"] = "C-PageDown", "U-C"
    keymap_global["U1-C-P"] = "C-PageUp", "U-C"

    keymap_global["U1-S-N"] = "S-PageDown", "U-S"
    keymap_global["U1-S-P"] = "S-PageUp", "U-S"

    keymap_global["U1-C-S-N"] = "C-S-PageDown", "U-C", "U-S"
    keymap_global["U1-C-S-P"] = "C-S-PageUp", "U-C", "U-S"

    # 変換-; -> Enter
    keymap_global["U1-Semicolon"] = "Enter"

    # 変換-U -> Alt-↑(Explorer用)
    keymap_global["U1-U"] = "Alt-Up",

    # =================================================
    # 無変換、変換とQWERTYUIOP[]の組み合わせ
    # =================================================
    # 変換-QWERT -> !@#$%
    keymap_global["U1-Q"] = "S-1"
    keymap_global["U1-W"] = "Atmark"
    keymap_global["U1-E"] = "S-3"
    keymap_global["U1-R"] = "S-4"
    keymap_global["U1-T"] = "S-5"

    # 無変換-YUIOP[] -> ^&*()-=
    keymap_global["U0-Y"] = "Caret"
    keymap_global["U0-U"] = "S-6"
    keymap_global["U0-I"] = "S-Asterisk"
    keymap_global["U0-O"] = "S-8"
    keymap_global["U0-P"] = "S-9"
    keymap_global["U0-Atmark"] = "Minus"
    keymap_global["U0-S-Atmark"] = "S-BackSlash"
    keymap_global["U0-OpenBracket"] = "S-Minus"
    keymap_global["U0-S-OpenBracket"] = "Add"

    # =================================================
    # 無変換、変換の同時押し
    # =================================================
    keymap_global["U0-U1-Q"] = "1"
    keymap_global["U0-U1-W"] = "2"
    keymap_global["U0-U1-E"] = "3"
    keymap_global["U0-U1-R"] = "4"
    keymap_global["U0-U1-T"] = "5"
    keymap_global["U0-U1-Y"] = "6"
    keymap_global["U0-U1-U"] = "7"
    keymap_global["U0-U1-I"] = "8"
    keymap_global["U0-U1-O"] = "9"
    keymap_global["U0-U1-P"] = "0"
    keymap_global["U0-U1-Atmark"] = "Minus"




























































































    keymap_global["U0-U1-S-Atmark"] = "S-BackSlash"
    keymap_global["U0-U1-OpenBracket"] = "S-Minus"
    keymap_global["U0-U1-S-OpenBracket"] = "Add"

    # =================================================
    # 左Ctrlキーとの組み合わせ(Emacs仕様)
    # =================================================

    # 以下、キー操作の置き換え定義
    # カーソルの移動
    keymap_global["LC-A"] = "Home", "U-C", "U-S"
    keymap_global["LC-S-A"] = "D-S", "Home", "U-S", "U-C", "U-S"

    keymap_global["LC-S-E"] = "D-S", "End", "U-S", "U-C", "U-S"
    keymap_global["LC-F"] = "Right", "U-C", "U-S"
    keymap_global["LC-B"] = "Left", "U-C", "U-S"
    keymap_global["LC-P"] = "Up", "U-C", "U-S"
    keymap_global["LC-N"] = "Down", "U-C", "U-S"

    keymap_global["LC-Alt-F"] = "C-Right", "U-C"
    keymap_global["LC-Alt-B"] = "C-Left", "U-C"
    keymap_global["LC-Alt-P"] = "C-Up", "U-C"
    keymap_global["LC-Alt-N"] = "C-Down", "U-C"

    # かな切替
    keymap_global["LC-O"] = "D-(244)", "U-(244)"

    # Esc
    keymap_global["LC-Atmark"] = "Esc"

    # TAB
    keymap_global["LC-I"] = "TAB"
    keymap_global["LC-S-I"] = "S-TAB", "U-S"

    # 削除
    keymap_global["LC-H"] = "Back"
    keymap_global["LC-D"] = "Delete"

    # 検索
    keymap_global["LC-S"] = "C-F", "U-C"

    # 改行
    keymap_global["LC-J"] = "Return"

    # 行末までカット
    keymap_global["LCTrl-K"] = "D-S", "End", "U-S", "LC-X", "U-C"

    # カット
    keymap_global["LC-W"] = "U-S", "C-X", "U-C", "U-S"

    # =================================================
    # Xキー押下後の動作

    keymap_global["LC-X"] = keymap.defineMultiStrokeKeymap("C-X")
    # 保存
    keymap_global["LC-X"]["LC-S"] = "LC-S", "U-C"

    # タブを閉じる等
    keymap_global["LC-X"]["LC-W"] = "LC-W", "U-C"

    # アプリを閉じる
    # keymap_global["LC-X"]["LC-C"] = "LA-F4", "U-A"
    keymap_global["LC-X"]["LC-C"] = "LC-W", "U-C"

    # コンテキストメニュー
    keymap_global["LC-X"]["LC-X"] = "Apps"

    # Keyhac：設定ファイル再読み込み
    keymap_global["LC-X"]["LC-R"] = keymap.command_ReloadConfig

    # =================================================
    # US配列変換
    # =================================================
    # S-2 -> @
    keymap_global["S-2"] = "Atmark"

    # S-6 -> ^
    keymap_global["S-6"] = "Caret"

    # S-7 -> &
    keymap_global["S-7"] = "S-6"

    # S-8 -> *
    keymap_global["S-8"] = "S-Asterisk"

    # S-9 -> (
    keymap_global["S-9"] = "S-8"

    # S-9 -> )
    keymap_global["S-0"] = "S-9"

    # S-ハイフン -> _
    keymap_global["S-Minus"] = "LS-BackSlash"

    # ハイフン -> =
    keymap_global["Caret"] = "S-Minus"
    keymap_global["C-Caret"] = "C-Add"

    # S-= -> +
    keymap_global["S-Caret"] = "Add"
    keymap_global["C-S-Caret"] = "C-S-Add"

    # \ -> `
    keymap_global["Yen"] = "S-Atmark"

    # S-\ -> ~
    keymap_global["S-Yen"] = "S-Caret"
    # :
    keymap_global["S-Semicolon"] = "Semicolon"
    keymap_global["Semicolon"] = "Colon"
    keymap_global["C-Semicolon"] = "C-Colon"

    # '
    # keymap_global["Colon"] = "S-Quote"
    # keymap_global["C-Colon"] = "C-S-Quote"
    keymap_global["S-Colon"] = "S-Quote"

    # "
    # keymap_global["S-Colon"] = "S-DoubleQuote"
    keymap_global["Colon"] = "S-DoubleQuote"

    # 全角半角 -> `
    keymap_global["244"] = "S-Atmark"

    # SHIFT + 全角半角 -> ~
    keymap_global["S-244"] = "S-Caret"

    # @ -> [
    keymap_global["Atmark"] = "OpenBracket"

    # [ -> ]
    keymap_global["OpenBracket"] = "CloseBracket"
    keymap_global["C-OpenBracket"] = "C-CloseBracket"

    # ` -> {
    keymap_global["S-Atmark"] = "S-OpenBracket"

    # { -> }
    keymap_global["S-OpenBracket"] = "S-CloseBracket"

    keymap_global["CloseBracket"] = "Yen"
    keymap_global["S-CloseBracket"] = "S-Yen"


    # 特殊系
    keymap_global["LC-Semicolon"] = "Return"

    # Mint用
    # EnterをAltにする
    # keymap.replaceKey("Enter", "LAlt")

    # RealForce用の設定
    # keymap.replaceKey("LWin", "LAlt")
    # keymap.replaceKey("LAlt", "LWin")

    # Real Force用の設定
    # 左下のCapsLockをESCにする
    # keymap_global["(240)"] = "D-Esc", "U-Esc"
