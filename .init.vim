if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug"入時にへ点滅の縦棒タイプのカーソ
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
" Git
Plug 'tpope/vim-fugitive'
" ColorScheme
Plug 'cocopon/iceberg.vim'
" StatusLine
Plug 'gkeep/iceberg-dark'
Plug 'itchyny/lightline.vim'
let g:lightline = { 'colorscheme': 'icebergDark' }

" LanguageClient
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" for rails
Plug 'slim-template/vim-slim'

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag'

" Filer
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern.vim' "Powerful vim filer
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'LumaKernel/fern-mapping-fzf.vim'
Plug 'lambdalisue/fern-hijack.vim'

" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" rainbow
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
" auto-pairs
Plug 'jiangmiao/auto-pairs'

" FuzzyFinder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

set number
set cursorline
set clipboard=unnamed
filetype plugin indent on
set belloff=all

"タブ/インデント
set expandtab " タブ入力を複数の空白入力に置き換える
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 言語に合わせて適切にインデントを自動挿入
set shiftwidth=4 " smartindentで増減する幅
set softtabstop=4 " 連続した空白に対してタブきーやバックスペースキーでカーソルが動く幅
set smartindent " 改行に前の行の構文をテェックし次の行のインデントを増幅する
set backspace=2
set sidescroll=2

" 文字列検索
set incsearch " インクリメンタルサーチ、1文字入力ごとに検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch

syntax on
" Important!!
if has('termguicolors')
    set termguicolors
endif

colorscheme iceberg

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['~/.nodebrew/current/bin/typescript-language-server', '--stdio'],
    \ 'typescript': ['~/.nodebrew/current/bin/typescript-language-server', '--stdio'],
    \ 'javascript.jsx': ['~/.nodebrew/current/bin/typescript-language-server', '--stdio'],
    \ 'typescript.tsx': ['~/.nodebrew/current/bin/typescript-language-server', '--stdio'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ 'go': ['~/go/bin/gopls'],
    \ 'sql': ['/Users/katasetakumi/.nodebrew/current/bin/sql-language-server', 'up', '--method', 'stdio'],
    \ }

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent> <F2> <Plug>(lcn-rename)
nnoremap <silent> @ :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

" Split window
nmap <silent> ss :split<Return><C-w>w
nmap <silent> sv :vsplit<Return><C-w>w

" Remap key
inoremap <C-j> <C-[>
vnoremap <C-j> <C-[>
nnoremap <S-h> ^
nnoremap <S-l> $
nnoremap <S-k> {
nnoremap <S-j> }
nnoremap <Left> <C-w><<CR>
nnoremap <Right> <C-w>><CR>
nnoremap <Up> <C-w>+<CR>
nnoremap <Down> <C-w>-<CR>

" Move Windows.
nnoremap sh <C-w>h
nnoremap sk <C-w>k
nnoremap sj <C-w>j
nnoremap sl <C-w>l

"Switch Tabs.
nnoremap <silent> <S-Tab> :-tabnext<Return>
nnoremap <silent> <Tab> :tabnext<Return>
" for deoplete
let g:deoplete#enable_at_startup = 1
set completeopt=menuone

set cmdheight=1
set nocompatible

" for Fern.vim plugins
let g:fern#renderer = "nerdfont"

" Import self function
source ~/.config/nvim/VimFiles/FuzzyFinder.vim
source ~/.config/nvim/VimFiles/ToggleWindowSize.vim
source ~/.config/nvim/VimFiles/startFernScripts.vim

filetype on
