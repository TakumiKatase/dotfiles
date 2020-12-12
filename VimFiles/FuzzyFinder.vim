nnoremap <C-S-f> :FZFFileList<CR>
command! FZFFileList call fzf#run({
            \ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store',
            \ 'sink': 'e'})
