source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
set nocompatible


:set incsearch
:set scrolloff=5
:set ignorecase
:set smartcase
syntax enable
:set wildignore=*.o,*.obj,*.bak,*.exe
" For writing ruby hashes...
imap <C-h> <Space>=><Space>
" Copy whole file (to vim buffer)
nnoremap <F1> mqggyG`q
" Remove previous search highlight on <CR>
nnoremap <CR> :noh<CR><CR>

" (Un)commenting lines of code
map ,# :s/^/#/<CR>:noh<CR>
map ,/ :s/^/\/\//<CR>:noh<CR>
map ,> :s/^/> /<CR>:noh<CR>
map ," :s/^/\"/<CR>:noh<CR>
map ,% :s/^/%/<CR>:noh<CR>
map ,! :s/^/!/<CR>:noh<CR>
map ,; :s/^/;/<CR>:noh<CR>
map ,- :s/^/--/<CR>:noh<CR>
map ,c mq:s/^\/\{2,\}\\|^--\\|^> \\|^\([#"%!;]\)\1*//<CR> <Esc>:noh<CR>`q

set history=700
filetype plugin on
filetype indent on
set autoread
set wildmenu
set ruler
set cmdheight=2
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set hlsearch
set lazyredraw
set magic
set showmatch
set mat=2
colorscheme desert
set encoding=utf8
set ffs=unix,dos,mac
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set ai
set si
set wrap
map j gj
map k gk
map <space> /
map <c-space> ?
set laststatus=2
cmap w!! w !sudo tee > /dev/null %
set errorformat=""
nnoremap <F5> :ls<CR>:e<Space>#
