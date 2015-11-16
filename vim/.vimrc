
syntax on
colorscheme custom

set nocompatible
set number
set showcmd
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set expandtab
set backspace=indent,eol,start
set encoding=utf-8
set ruler " cursor coordinates
set showcmd " show commands as they're begin typed
set laststatus=2 " always show statusline
set cursorline " illuminate the cursors current position
set noswapfile
set backupdir=~/.vim/tmp " dump everything in a temp directory
set directory=~/.vim/tmp
set undodir  =~/.vim/tmp
set copyindent
set ttyfast


" set colorcolumn=80 " illuminates column number X

" ============ Settings for status bar =============
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" ====================== Controls ======================
imap jj <Esc>

" line swapping
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" In many terminal emulators the mouse works just fine, so I enable it.
if has('mouse')
    set mouse=a
endif


" ==================== Vundle ======================

call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
" Plug 'bling/vim-airline'

call plug#end()

