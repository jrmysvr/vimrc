set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Flash yanked area
Plugin 'kana/vim-operator-user'
Plugin 'haya14busa/vim-operator-flashy'

" better JSON for Vim
Plugin 'elzr/vim-json'

" fugitive.vim: A Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive'

" The monokai color scheme.
Plugin 'filfirst/Monota'

" The project source tree browser.
Plugin 'scrooloose/nerdtree'

" The enhanced editor status bar.
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" The enhanced C++ syntax highlighting.
Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'neoclide/coc.nvim', {'branch':'release'}

" Auto-Indentation Python
Plugin 'vim-scripts/indentpython.vim'

" Check Python Syntax
Plugin 'vim-syntastic/syntastic'

" PEP 8 checking
Plugin 'nvie/vim-flake8'

" Super Searching
Plugin 'kien/ctrlp.vim'

" tmux navigation
Plugin 'christoomey/vim-tmux-navigator'

" Nerd Commenting
Plugin 'scrooloose/nerdcommenter'

" Auto PEP8
Plugin 'tell-k/vim-autopep8'

" Markdown Preview
Plugin 'shime/vim-livedown'

" Markdown Pandoc
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

" Rust support
Plugin 'rust-lang/rust.vim'

" Nim support
Plugin 'zah/nim.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ---------- Monokai color scheme ----------
" syntax on
colorscheme Monota
" colorscheme morning

" ---------- General Settings ----------
set backspace=indent,eol,start

syntax enable

" Show line numbers
set number

" Highlight matching brace
set showmatch

" Highlight all search results
set hlsearch

" Highlight the current cursor line
set cursorline

" Highlight the 80 columns margin.
set colorcolumn=80

" Trim the trailing white space on save.
autocmd BufWritePre <buffer> :%s/\s\+$//e

" ---------- Indentation ----------
" Use spaces instead of tabs
set expandtab

" Number of spaces that a <TAB> in the file counts for
set tabstop=4

" Number of auto-indent spaces
set shiftwidth=4
set autoindent

" ---------- Folding ----------
set foldenable
set foldmethod=syntax

" Do not fold the code by default
set foldlevel=10000

" ---------- NerdTree Project Browser ----------
nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalMenu = 1


"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p

" Ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" ----------- Nerd Commenter ---------------
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1


" ---------- Enhanced C++ syntax highlighting ----------
let g:cpp_class_scope_highlight=1
let g:cpp_concepts_highlight=1
let g:cpp_experimental_simple_template_highlight=1

set clipboard=unnamed

" Flag unnecessary whitespace
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" ----------- Syntastic ----------------

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:sytastic_python_checkers=['autopep8', 'pylint']

" ----------- Autopep8 ---------------

let g:autopep8_ignore="E221"
let g:autopep8_ignore="E402"
let g:autopep8_max_line_length=79
let g:autopep8_aggressive=1
let g:autopep8_on_save=1
let g:autopep8_disable_show_diff=1

set termguicolors
set guicursor=
set signcolumn=yes
set cmdheight=2
set nobackup
set nowritebackup
set hidden

" --------- Vim Operator Flashy --------
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" --------- Rust Support ----------
au BufNewFile, BufRead *.rs
    \ set tabstop=4|
    \ set softtabstop=4|
    \ set shiftwidth=4|
    \ set textwidth=100|
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix|
    \ set encoding=utf-8|

" --------- Nim Support ----------
au BufNewFile, BufRead *.nim
    \ set tabstop=2|
    \ set softtabstop=2|
    \ set shiftwidth=2|
    \ set textwidth=80|
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix|
    \ set encoding=utf-8|
"
" ---------- Python Support -------------
au BufNewFile, BufRead *.py
    \ set tabstop=4|
    \ set softtabstop=4|
    \ set shiftwidth=4|
    \ set textwidth=79|
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix|
    \ set encoding=utf-8|



