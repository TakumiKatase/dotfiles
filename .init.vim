if has('vim_starting')
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set nocompatible
set wildmenu
let mapleader = "\<Space>"

call plug#begin('$HOME/.local/share/nvim/plugged')
" colorscheme
Plug 'srcery-colors/srcery-vim'

" more beautiful and powerful syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" StatusLine
Plug 'devoc09/lualine.nvim'

" lsp-client
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }

" for ruby
Plug 'tpope/vim-endwise', {'for': 'ruby'}
" for go
Plug 'mattn/vim-goimports', {'for': 'go'}

Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag', {'for': ['html','xml']}

" Filer
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons', {'for': 'defx'}
Plug 'kristijanhusak/defx-git', {'for': 'defx'}
Plug 'ryanoasis/vim-devicons'

" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" auto-pairs
Plug 'jiangmiao/auto-pairs'

" FuzzyFinder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" easy way to cursol-move
Plug 'easymotion/vim-easymotion'

" Local Plugins
Plug '~/dotfiles/VimFiles/my-fzf-conf'
Plug '~/dotfiles/VimFiles/togglewindow'
Plug '~/dotfiles/VimFiles/my-defx-conf'

call plug#end()

" set number
set cursorline
set clipboard=unnamed
set belloff=all
set splitright

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

" set background=dark
syntax enable

" Important!!
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
" set t_Co=256

colorscheme srcery
" opacity settings
" highlight Normal ctermbg=NONE guibg=NONE
" highlight NonText ctermbg=NONE guibg=NONE
" highlight LineNr ctermbg=NONE guibg=NONE
" highlight Folded ctermbg=NONE guibg=NONE
" highlight EndOfBuffer ctermbg=NONE guibg=NONE

" Required for operations modifying multiple buffers like rename.
" set hidden
"
" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
highlight = {
enable = true,              -- false will disable the whole extension
disable = { "vue" },  -- list of language that will be disabled
},
}
EOF

" lualine
lua <<EOF
require'lualine'.setup {
options = {
theme = 'srcery'
}
}
EOF

let g:LanguageClient_serverCommands = {
            \ 'c': ['ccls', '--log-file=/tmp/cc.log'],
            \ 'python': ['/usr/local/bin/pyls'],
            \ 'ruby': ['~/.rbenv/versions/2.6.0/bin/solargraph', 'stdio'],
            \ 'go': ['~/go/bin/gopls'],
            \ 'haskell': ['haskell-language-server-wrapper', '--lsp'],
            \ 'sql': ['~/.nodebrew/current/bin/sql-language-server', 'up', '--method', 'stdio'],
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
nmap <silent> sv :vsplit<Return>
nmap <silent> st :tabnew<Return>

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
nnoremap <S-o> <C-o>
nnoremap <S-i> <C-i>

"Switch Tabs.
nnoremap <silent> <S-Tab> :-tabnext<Return>
nnoremap <silent> <Tab> :tabnext<Return>
" for deoplete
let g:deoplete#enable_at_startup = 1
set completeopt=menuone

set cmdheight=1
" Defx conf
nnoremap <silent>sf :Defx <CR>

" Easymotion
let g:EasyMotion_do_mapping = 0 "Disable default mappings
nmap <Leader>s <Plug>(easymotion-s2)

" use Termianl shortcut
autocmd TermOpen * startinsert
function s:vsplitTerm()
    execute 'vsplit'
    execute 'term'
endfunction
function s:splitTerm()
    execute 'split'
    execute 'term'
endfunction
command! -count -nargs=* Vsterm call s:vsplitTerm()
command! -count -nargs=* Sterm call s:splitTerm()
nmap <silent> tt :Vsterm<CR>
nmap <silent> ts :Sterm<CR>
tnoremap <silent><C-j> <C-\><C-n>

filetype on
