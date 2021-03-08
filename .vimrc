if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug "入時にへ点滅の縦棒タイプのカーソ
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
set nocompatible
set wildmenu
let mapleader = "\<Space>"

" vim-plugのプラグイン
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}

" ColorScheme
Plug 'pineapplegiant/spaceduck', {'branch': 'main'}

" LanguageClient
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" for rails
Plug 'slim-template/vim-slim', {'for': 'slim'}

" for ruby and rails
Plug 'tpope/vim-endwise', {'for': 'ruby'}
Plug 'tpope/vim-rails', {'for': ['erb', 'slim']}

Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag', {'for': ['html','xml']}

" Filer
Plug 'Shougo/defx.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'kristijanhusak/defx-icons', {'for': 'defx'}
Plug 'kristijanhusak/defx-git', {'for': 'defx'}
Plug 'ryanoasis/vim-devicons'

" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Terminal
Plug 'voldikss/vim-floaterm'

" rainbow
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
" auto-pairs
Plug 'jiangmiao/auto-pairs'

" FuzzyFinder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Local Plugins
Plug '~/dotfiles/VimFiles/my-fzf-conf'
Plug '~/dotfiles/VimFiles/togglewindow'
Plug '~/dotfiles/VimFiles/my-defx-conf'
Plug '~/src/vimscript/minline'

call plug#end()

set number
set laststatus=2
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

set background=dark
syntax on

" Important!!
if has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

colorscheme spaceduck
" opacity settings
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

" Required for operations modifying multiple buffers like rename.
" set hidden

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['~/.nodebrew/current/bin/typescript-language-server', '--stdio'],
    \ 'typescript': ['~/.nodebrew/current/bin/typescript-language-server', '--stdio'],
    \ 'javascript.jsx': ['~/.nodebrew/current/bin/typescript-language-server', '--stdio'],
    \ 'typescript.tsx': ['~/.nodebrew/current/bin/typescript-language-server', '--stdio'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/versions/2.6.0/bin/solargraph', 'stdio'],
    \ 'go': ['~/go/bin/gopls'],
    \ 'sql': ['/Users/katasetakumi/.nodebrew/current/bin/sql-language-server', 'up', '--method', 'stdio'],
    \ 'vim': ['~/.nodebrew/current/bin/vim-language-server', '--stdio'],
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
nmap <silent> st :tabnew<Return>

" Remap key
inoremap <C-j> <C-[>
vnoremap <C-j> <C-[>
nnoremap <Leader>o <C-o>
nnoremap <Leader>n <C-i>
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

" Defx conf
nnoremap <silent>sf :Defx <CR>

" Floating Terminal
let g:floaterm_keymap_new = '<Leader>tf'
let g:floaterm_keymap_next = '<Leader>tn'
let g:floaterm_keymap_prev = '<Leader>tp'
let g:floaterm_keymap_toggle = '<Leader>tt'
hi Floaterm guibg=black
hi FloatermBorder guibg=cyan guifg=cyan

filetype on
