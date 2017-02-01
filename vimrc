
set history=800
filetype plugin indent on

set mouse=v

" Turn on the wild menu
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc

set encoding=utf-8
" set textwidth=79
set ruler
set number

" Highlight search results
set hlsearch
set showmatch
set ignorecase
set smartcase
" set mouse=a

set wrapscan

syntax on
colorscheme desert
set background=dark

" Use spaces instead of tabs
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

" Show file name
set laststatus=2


" let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='FileExplorer'
nmap wm :WMToggle<cr>

map <F4> :tabc<cr>

set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
if filereadable(".vim.custom")
    so .vim.custom
endif

" map tabnext tabprevious

" Setup Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/Conque-GDB'
call vundle#end()            " required
