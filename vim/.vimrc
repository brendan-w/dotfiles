
syntax on
colorscheme custom

set number
set showcmd
set tabstop=4
set autoindent
set smartindent
set expandtab

" ================ Persistent Undo =================
" Keep undo history across sessions, by storing in file.
if version >= 730
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
endif

" ============ Settings for status bar =============
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" ====================== Keys ======================
imap jj <Esc>

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

