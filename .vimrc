set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" To ignore plugin indent changes, instead use:
" filetype plugin on
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Aligning tabs nicely, e.g. :Tab /=>
Plugin 'godlygeek/tabular'

" Easy rails navigation, including Emodel, Rails and Rake commands
Plugin 'tpope/vim-rails'

" Syntax checking for most languages
Plugin 'scrooloose/syntastic'

" Git wrapper, for commands like Gblame
Plugin 'tpope/vim-fugitive'

" Explore the filesystem in a vim split
Plugin 'scrooloose/nerdtree'

" Various navigation and highlighting, e.g. ]m to go to next method definition
Plugin 'vim-ruby/vim-ruby'

" Tab to auto-complete words; easier than CTRL+n
Plugin 'ervandew/supertab'

" Auto-insert words like 'end', 'endif', etc.
Plugin 'tpope/vim-endwise'

" Edit 'surroundings', e.g. cs(' to change (Test) to 'Test'
Plugin 'tpope/vim-surround'

" Select text in visual mode, then press * to search for it
Plugin 'bronson/vim-visual-star-search'

" Display indent level
Plugin 'Yggdroot/indentLine'
" I used to use this one instead, but found it made my cursor disappear
" sometimes, which was annoying!
" Plugin 'nathanaelkane/vim-indent-guides'


" The following are examples of different formats supported.
"" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

call vundle#end()            " required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


filetype plugin indent on    " required

" Powerline config
let g:Powerline_stl_path_style = 'full'

" Syntastic config
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_error_symbol = "X"
let g:syntastic_style_error_symbol = ">"
let g:syntastic_warning_symbol = "!"
let g:syntastic_style_warning_symbol = ">"

" indentLine config
" let g:indentLine_char = '┆' " Some alternatives: ¦ ┆ ︙ │ ︙ - but beware of UTF8-weirdness!

colorscheme desert

" Stop vim from saving .<filename>.swp files - they only get in the way!
set noswapfile
set incsearch
" Leave a 'buffer' near top and botom of screen when scrolling
set scrolloff=5
set ignorecase
set smartcase
syntax enable
set wildignore=*.o,*.obj,*.bak,*.exe
" Copy whole file (to vim buffer)
nnoremap <F1> mqggyG`q
" Remove previous search highlight on <esc>
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
map ,c mm:s/^\/\{2,\}\\|^--\\|^> \\|^\([#"%!;]\)\1*//<CR> <Esc>:noh<CR>`m

" Ctrl-j/k inserts blank line below/above
nnoremap <silent><C-j> :set paste<CR>o<Esc>:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Use jkl; for navigation, not hjkl. This is much better for touch typing!
"noremap ; l
"noremap l k
"noremap k j
"noremap j h
"" Keep functionality of ; just in case I ever need it
"noremap h ;


" Make Y behave like D, i.e. copy to end of line
nnoremap Y y$

" Make ctrl+p inssert 'binding.pry'
nnoremap <C-p> :set paste<CR>obinding.pry<ESC>:set nopaste<CR>

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
set encoding=utf8
set ffs=unix,dos,mac
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set ai
set si
set wrap
map <space> /
map <c-space> ?
set laststatus=2
cmap w!! w !sudo tee > /dev/null %
set errorformat=""
nnoremap <F5> :ls<CR>:e<Space>#

let mapleader = ","

" Shortcut to toggle spelling on/off, with `,s`
nmap <silent> <leader>s :set spell!<CR>

" Set region to British English (for spelling)
set spelllang=en_gb

" Stronger encryption algorithm than the default ("zip"). To encrypt, use :X
set cm=blowfish
