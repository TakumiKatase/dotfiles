set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 "保存時の文字コード
set ambiwidth=double "□や○文字が崩れる問題を解決

"タブ/インデント
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=2 " 画面上でタブが占める幅
set softtabstop=2 " 連続した空白に対してタブきーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行に前の行の構文をテェックし次の行のインデントを増幅する
set shiftwidth=2 " smartindentで増減する幅

" 文字列検索
set incsearch " インクリメンタルサーチ、1文字入力ごとに検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
"set background=dark コメントアウトを解除するとダークモードに
syntax on

set cursorline
set number

set nocompatible
filetype plugin indent off

if has('vim_starting')
"入時にへ点滅の縦棒タイプのカーソ
	let &t_SI .= "\e[6 q"
	" ノーマルモード時に非点滅のブロックタイプのカーソル
	let &t_EI .= "\e[2 q"
	" 置換モード時に非点滅の下線タイプのカーソル
	let &t_SR .= "\e[4 q"

endif

" vim-plugのプラグイン
call plug#begin('~/.vim/plugged')

Plug 'Shougo/neobundle.vim'

" ステータスラインの表示内容強化
Plug 'itchyny/lightline.vim'
Plug 'bronson/vim-trailing-whitespace'
" Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
" インデントに色をつけて見やすくする
" Plug 'nathanaelkane/vim-indent-guides'
" let g:indent_guides_enable_on_vim_startup = 1

" シングルクオートとダブルクオートの入れ替えなど
Plug 'tpope/vim-surround'

" タブ文字の表示はば
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2

" ステータスラインの設定
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set statusline+={fugitive#statusline()}

" 自動的に閉じ括弧を入力
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

call plug#end()

