set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 "保存時の文字コード
set ambiwidth=double "□や○文字が崩れる問題を解決


" vim-plugのプラグイン
call plug#begin('~/.vim/plugged')

Plug 'Shougo/neobundle.vim'

" ステータスラインの表示内容強化
Plug 'itchyny/lightline.vim'
let g:lightline = {'colorscheme': 'onedark'}
Plug 'bronson/vim-trailing-whitespace'
" Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'joshdick/onedark.vim'

" インデントに色をつけて見やすくする
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" シングルクオートとダブルクオートの入れ替えなど
Plug 'tpope/vim-surround'

" タブ文字の表示はば
set tabstop=4
" Vimが挿入するインデントの幅
set shiftwidth=4

" ステータスラインの設定
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set statusline+={fugitive#statusline()}

" clopboard setting
set clipboard+=unnamed

" javascript関係
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }
let g:javascript_plugin_jsdoc = 1

" Ruby
Plug 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['ruby']}
let g:syntastic_ruby_checkers = ['rubocop']
Plug 'slim-template/vim-slim'
" ログファイルを色付けしてくれる
Plug 'vim-scripts/AnsiEsc.vim'
" CSVをカラム単位に色分けする
Plug 'mechatroner/rainbow_csv'
"< to <% and > to %> in erb file type
Plug 'devoc09/vim-erb'
" for rails
Plug 'tpope/vim-rails'

"Go
Plug 'fatih/vim-go'

"Be comment string
Plug 'devoc09/vim-commenter'

" Search Files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'

call plug#end()

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

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none

let g:hybrid_use_iTerm_colors = 1
colorscheme onedark
set background=dark " コメントアウトを解除するとダークモードに
syntax on

set cursorline
set number

set nocompatible

" fzf key mapping
nnoremap <silent> ,f :GFiles<CR>
nnoremap <silent> ,F :GFiles?<CR>
nnoremap <silent> ,b :Buffers<CR>
nnoremap <silent> ,l :BLines<CR>
nnoremap <silent> ,h :History<CR>
nnoremap <silent> ,m :Mark<CR>

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" NERDTree command mapping
nnoremap <silent> :NT :NERDTree<CR>

if has('vim_starting')
"入時にへ点滅の縦棒タイプのカーソ
	let &t_SI .= "\e[6 q"
	" ノーマルモード時に非点滅のブロックタイプのカーソル
	let &t_EI .= "\e[2 q"
	" 置換モード時に非点滅の下線タイプのカーソル
	let &t_SR .= "\e[4 q"

endif
" filetypeの自動検出(最後の方に書いたほうがいいらしい)
filetype on
