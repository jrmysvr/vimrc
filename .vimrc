" ---------- General Settings ----------
set encoding=utf-8
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

" Highlight the columns margin.
set textwidth=100
set colorcolumn=100

" Trim the trailing white space on save.
autocmd BufWritePre <buffer> :%s/\s\+$//e

" Number of spaces that a <TAB> in the file counts for
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set linebreak
set showmatch
set showbreak=+++
set smartcase
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set confirm
set ruler
set autochdir
set autowriteall
set undolevels=1000
set backspace=indent,eol,start

set termguicolors
set guicursor=
set signcolumn=yes
set cmdheight=2
set nobackup
set nowritebackup
set hidden

set noerrorbells
set spell
set wrap

" F3: Toggle list (display unprintable characters).
nnoremap <F3> :set list!<CR>
set listchars=space:\.

set nocompatible              " be iMproved, required
filetype off                  " required

" -------- Vundle --------

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Flash yanked area
Plugin 'kana/vim-operator-user'
Plugin 'haya14busa/vim-operator-flashy'

" The monokai color scheme.
Plugin 'filfirst/Monota'

" The project source tree browser.
Plugin 'scrooloose/nerdtree'

" A light and configurable statusline/tabline plugin for Vim
Plugin 'itchyny/lightline.vim'

" Super Searching
Plugin 'kien/ctrlp.vim'

" tmux navigation
Plugin 'christoomey/vim-tmux-navigator'

" VimWiki
Plugin 'vimwiki/vimwiki'

" Markdown Preview
Plugin 'shime/vim-livedown'

" Markdown Pandoc
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

" Latex Support
Plugin 'lervag/vimtex'
Plugin 'sirver/ultisnips'

"   This is for color themes

Plugin 'colepeters/spacemacs-theme.vim'
Plugin 'sainnhe/gruvbox-material'
Plugin 'phanviet/vim-monokai-pro'
Plugin 'flazz/vim-colorschemes'
Plugin 'chriskempson/base16-vim'
Plugin 'gruvbox-community/gruvbox'

"   This is a selection of plugins to make prose writing easier.

Plugin 'dpelle/vim-LanguageTool'
Plugin 'ron89/thesaurus_query.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'reedes/vim-pencil'
Plugin 'reedes/vim-wordy'

"This section deals with workspace and session management

Plugin 'thaerkh/vim-workspace'

"Related to above, the following code saves all session files in a single directory outside your
"workspace

let g:workspace_session_directory = $HOME . '/.vim/sessions/'


"Related to above, this is a activity tracker for vim

"Plugin 'wakatime/vim-wakatime'

" A disturbance in the force: we are using some emacs functionality here, org-mode specifically

Plugin 'jceb/vim-orgmode'

"  This is for language-specific plugins

Plugin 'plasticboy/vim-markdown'

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

" colorscheme Monota
colorscheme pacific
set background=dark

" ---------- NerdTree Project Browser ----------
nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalMenu = 1

" --------- Vim Operator Flashy --------
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" -------- Lightline ---------
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'realpath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \ },
      \ }

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

" ------- Latex -------
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtext_compiler_progname = 'nvr'

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

setlocal spell spelllang=en_us,de_ch
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" ------ General -------
" Flag unnecessary whitespace
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h,*.cpp,*.hpp match BadWhitespace /\s\+$/
