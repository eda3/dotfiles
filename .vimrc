
syntax on

" TypeScript
autocmd BufRead,BufNewFile *.ts set filetype=typescript


set tabstop=4 " タブのスペース数
set shiftwidth=4 " インデント時のスペース数
set expandtab " タブ文字をスペースにする
set nu " 行番号表示

let g:indent_guides_enable_on_vim_startup=1 " vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_start_level=2 " ガイドをスタートするインデントの量
let g:indent_guides_auto_colors=0 " 自動カラーを無効にする
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray " 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray " 偶数インデントのカラー
let g:indent_guides_color_change_percent = 30 " ハイライト色の変化の幅
let g:indent_guides_guide_size = 1 " ガイドの幅


" 折り返さない(戻すときは :set wrap)
set nowrap 

"参考 何も考えず~/.vimrcにこれを書くんだ！ 〜vim初心者によるvim初心者のためのvim入門〜 - Qiita http://qiita.com/mfujimori/items/9fd41bcd8d1ce9170301
set nobackup " バックアップファイルを作らない
set noswapfile " スワップファイルを作らない
set autoread " 編集中のファイルが変更されたら自動で読み直す
set hidden " バッファが編集中でもその他のファイルを開けるように
set showcmd " 入力中のコマンドをステータスに表示する

set cursorline " 現在の行を強調表示

set smartindent " インデントをスマートに

set laststatus=2 " ステータスラインを常に表示
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 

" コメントアウトの改行で自動コメントアウトを廃止
" 参考：vimで一気にコメントアウトする方法(複数行の先頭に文字を追加する方法) - Qiita
" http://qiita.com/shirochan/items/174c3169344043449339
set formatoptions-=ro

" 検索結果をハイライトする http://kaworu.jpn.org/kaworu/2010-11-20-1.php
set hlsearch

" search インクリメンタルサーチを使う方法 http://kaworu.jpn.org/kaworu/2010-11-21-1.php
set incsearch

set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

" クリップボード連携
" MacのVimでHomebrewを使ってクリップボード連携を有効にする - Qiita http://qiita.com/shoma2da/items/92ea8badcd4655b6106c
set clipboard+=unnamed

" =====================================================================================================
" キーバインド
" =====================================================================================================
" vimから編集中のrubyスクリプトを実行 - Qiita http://qiita.com/smison/items/2ee7aaa88299f6972c52
nnoremap <C-e> :!ruby %<ENTER>
nnoremap <C-e><C-r> :!rails test %<ENTER>

" python を実行
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!py %
"nnoremap <C-e> :!py %<ENTER>

nnoremap <Space>ig :IndentGuidesToggle

"インクリメント、デクリメント
nnoremap + <C-a>
nnoremap - <C-x>


" ぼくのかんがえたさいしょうのvimrc - derisの日記 http://deris.hatenablog.jp/entry/2014/05/20/235807
" 上書き保存や閉じsetを、スペース→ショートカットキーに
nnoremap <Space>w :<C-u>w<CR>
nnoremap <Space>q :<C-u>q<CR>
nnoremap <Space>Q :<C-u>q!<CR>

" 行頭、行末をショートカットに
nnoremap <Space>h  ^
nnoremap <Space>l  $

" 空行挿入
nnoremap <Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Space>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

" vim-fugitive関連
" vim-fugitiveがやっぱり便利 - Qiit http://qiita.com/hyshhryk/items/4936c4412daa866daf7d
nnoremap <silent> <Space>gb :Gblame<CR>
nnoremap <silent> <Space>gd :Gdiff<CR>
nnoremap <silent> <Space>gs :Gstatus<CR>

" Command + j or k で行を移動する
nnoremap <D-j> :m+<CR>==
nnoremap <D-k> :m-2<CR>==
inoremap <D-j> <Esc>:m+<CR>==gi
inoremap <D-k> <Esc>:m-2<CR>==gi
vnoremap <D-j> :m'>+<CR>gv=gv

"個人的に便利だと思うVimの基本設定のランキングを発表します！ -
"プログラムモグモグ http://itchyny.hatenablog.com/entry/2014/12/25/090000
" y$をYにする
nnoremap Y y$


" 【Vim】80桁教信者の憂鬱 その２（ホットキーでトグル、他） | blog.remora.cx http://blog.remora.cx/2013/06/source-in-80-columns-2.html
noremap <Plug>(ToggleColorColumn)
            \ :<c-u>let &colorcolumn = len(&colorcolumn) > 0 ? '' :
            \   join(range(131, 9999), ',')<CR>
 
" ノーマルモードの 'cc' に割り当てる
nmap cc <Plug>(ToggleColorColumn)

let $BASH_ENV='~/.bashrc'


 " =====================================================================================================
" " vim-plug インストールするときは[:PlugInstall]
" " =====================================================================================================
" " NeoBundle から vim-plug に乗り換えてみた - Qiita http://qiita.com/jiminko/items/f4b337ab41db751388f7
"
" if has('lvim_starting')
"   set rtp+=~/.vim/plugged/vim-plug
"   if !isdirectory(expand('~/.vim/plugged/vim-plug'))
"     echo 'install vim-plug...'
"     call system('mkdir -p ~/.vim/plugged/vim-plug')
"     call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
"   end
" endif
"
" call plug#begin('~/.vim/plugged')
"   Plug 'junegunn/vim-plug',
"         \ {'dir': '~/.vim/plugged/vim-plug/autoload'}
"
"   " Unite.Vim タブ一覧出せる
"   Plug 'Shougo/unite.vim'
"
"   " vim-fugitive git関連
"   Plug 'tpope/vim-fugitive'
"
"   " lightline.vim ステータス部分強化
"   Plug 'itchyny/lightline.vim'
"
"   " vim-indent-guides インデントに色を塗ってくれる
"   " colorscheme molokai
"   Plug 'nathanaelkane/vim-indent-guides'
"
"   " vim-gitgutter gitの差分を表示してくれる
"   " Vimメモ : vim-gitgutterで差分を左端に表示する - もた日記 http://wonderwall.hatenablog.com/entry/2016/03/26/211710
"   Plug 'airblade/vim-gitgutter'
"
"   " surround.vimの使い方 | Memo on the Web http://motw.mods.jp/Vim/surround.html
"    yss - クォートをつける
"    ds  - クォートをけす
"    di  - クォート内の文を消す
"   " dit  - タグを消す
"   Plug 'tpope/vim-surround'
"
"   " vimの検索でマルチインクリメンタルハイライトを実現するincsearch.vim -
"   " http://kaworu.jpn.org/vim/vim%E3%81%AE%E6%A4%9C%E7%B4%A2%E3%81%A7%E3%83%9E%E3%83%AB%E3%83%81%E3%82%A4%E3%83%B3%E3%82%AF%E3%83%AA%E3%83%A1%E3%83%B3%E3%82%BF%E3%83%AB%E3%83%8F%E3%82%A4%E3%83%A9%E3%82%A4%E3%83%88%E3%82%92%E5%AE%9F%E7%8F%BE%E3%81%99%E3%82%8Bincsearch.vim
"   Plug 'haya14busa/incsearch.vim'
"   map /  <Plug>(incsearch-forward)
"   map ?  <Plug>(incsearch-backward)
"   map g/ <Plug>(incsearch-stay)
"
"   " vimでautocloseの設定をする - SundayHacking http://www.axlight.com/mt/sundayhacking/2015/02/vimautoclose.html
"   " Plug 'cohama/lexima.vim'
"
"   " vimで複数選択を可能にするプラグイン - Qiita http://qiita.com/Shunsuke-Komuta/items/c978a4bf5cbb020dca1d
"   Plug 'terryma/vim-multiple-cursors'
"
"   " tcomment.vim拡張してコメントアウトの効率あげる話 - Qiita http://qiita.com/alpaca_taichou/items/211cd62bee84c59ca480
"   " <C-_><C-_> 行、選択箇所をコメントをトグル
"   " <C-_>n 指定したftでコメントをトグル
"   " <C-_>s 詳細にコメント形式を指定してトグル
"   " <C-_>p 関数などブロック全体をトグル
"   " gcc 　　<C-_><C-_>と一緒
"   Plug 'tomtom/tcomment_vim'
"
"   " vimにNeoBundleとNeoCompleteを入れる - KayaMemo http://kayakuguri.github.io/blog/2015/12/24/neobundle-neocomplete/
"   Plug 'Shougo/neobundle.vim'
"
"   " 対応する括弧等を入力する生活に疲れた(Vim 編) - TIM Labs http://labs.timedia.co.jp/2012/09/vim-smartinput.html
"   Plug 'kana/vim-smartinput'
"
"   " Vim で Ruby の def end とかを自動入力する vim-endwise を vim-smartinput で実装してみた - 反省はしても後悔はしない http://cohama.hateblo.jp/entry/2013/11/08/013136
"   Plug 'cohama/vim-smartinput-endwise'
"
"   " TypeScript を vim に導入して Syntax Highlight する · GitHub https://gist.github.com/uupaa/9224470
"   Plug 'leafgarland/typescript-vim'
"
"   " 【VimとPythonの補完についてのメモ】
"   " https://kashewnuts.github.io/2018/08/22/jedivim_memo.html
"   Plug 'davidhalter/jedi-vim', {'for': 'python'}   " pythonファイルを編集するときだけ起動
"
" call plug#end()
"
" call smartinput_endwise#define_default_rules()
