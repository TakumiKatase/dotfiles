if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
"入時にへ点滅の縦棒タイプのカーソ
  let &t_SI .= "\e[6 q"
" ノーマルモード時に非点滅のブロックタイプのカーソル
  let &t_EI .= "\e[2 q"
" 置換モード時に非点滅の下線タイプのカーソル
  let &t_SR .= "\e[4 q"
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 "保存時の文字コード
set ambiwidth=double "□や○文字が崩れる問題を解決

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/vim-plug',{'dir': '~/.vim/plugged/vim-plug/autoload'}
  Plug 'prabirshrestha/async.vim'
" Language Server Client
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
" Git
  Plug 'tpope/vim-fugitive'
" ColorScheme
  Plug 'cocopon/iceberg.vim'
  Plug 'joshdick/onedark.vim'
let g:lightline = {'colorscheme': 'iceberg'}
" StatusLine
  Plug 'itchyny/lightline.vim'
" auto-complete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" auto-complete-end-for-ruby

" for rails
Plug 'ngmy/vim-rubocop'
Plug 'slim-template/vim-slim'

Plug 'tpope/vim-endwise'

call plug#end()

set clipboard+=unnamed

"タブ/インデント
set expandtab " タブ入力を複数の空白入力に置き換える
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 言語に合わせて適切にインデントを自動挿入
set shiftwidth=4 " smartindentで増減する幅
set softtabstop=4 " 連続した空白に対してタブきーやバックスペースキーでカーソルが動く幅
set smartindent " 改行に前の行の構文をテェックし次の行のインデントを増幅する
set backspace=2

" 文字列検索
set incsearch " インクリメンタルサーチ、1文字入力ごとに検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch

colorscheme iceberg
set background=dark " コメントアウトを解除するとダークモードに
syntax on

set cursorline

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

set nocompatible
filetype on
