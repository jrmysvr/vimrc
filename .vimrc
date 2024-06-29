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

set colorcolumn=80,99,120

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

set termguicolors
set guicursor=
set signcolumn=yes
set cmdheight=2
set nobackup
set nowritebackup
set hidden

" F3: Toggle list (display unprintable characters).
nnoremap <F3> :set list!<CR>
set listchars=space:\.

set nocompatible              " be iMproved, required
filetype off                  " required

" -------- vim-plug --------

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()

" Flash yanked area
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'

" better JSON for Vim
Plug 'elzr/vim-json'

" fugitive.vim: A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" The project source tree browser.
Plug 'scrooloose/nerdtree'

Plug 'nvim-lualine/lualine.nvim'

" The enhanced C++ syntax highlighting.
Plug 'octol/vim-cpp-enhanced-highlight'

" Plug 'neoclide/coc.nvim', {'branch':'release'}

" Auto-Indentation Python
Plug 'vim-scripts/indentpython.vim'

" PEP 8 checking
Plug 'nvie/vim-flake8'

" Python Black
Plug 'psf/black', {'branch':'stable'}

" Python Autocompletion
Plug 'davidhalter/jedi-vim'

" Pylint support
Plug 'gryf/pylint-vim'

Plug 'vim-syntastic/syntastic'

" Super Searching
Plug 'kien/ctrlp.vim'

" tmux navigation
Plug 'christoomey/vim-tmux-navigator'

" Nerd Commenting
Plug 'scrooloose/nerdcommenter'

" VimWiki
Plug 'vimwiki/vimwiki'

" Markdown Preview
Plug 'shime/vim-livedown'

" Markdown Pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
"
" Copilot Support
" Plug 'github/copilot.vim'

Plug 'kovetskiy/vim-bash'

" Latex Support
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'

" Asynchronous linting and make
Plug 'neomake/neomake'

" Go Support
Plug 'fatih/vim-go'

" Zig Support
Plug 'ziglang/zig.vim'

" Nim support
"Plug 'zah/nim.vim'
Plug 'alaviss/nim.nvim'

" Rust Support
Plug 'rust-lang/rust.vim'

" Jump support
Plug 'pechorin/any-jump.vim'

" Nightfox Theme
Plug 'EdenEast/nightfox.nvim'

" Moonfly Theme
Plug 'https://github.com/bluz71/vim-moonfly-colors'

" Kanagawa Theme
Plug 'https://github.com/rebelot/kanagawa.nvim'

" The monokai color scheme.
Plug 'filfirst/Monota'

" The falcon theme
Plug 'fenetikm/falcon'

" Everforest theme
Plug 'sainnhe/everforest'


" All of your Plugs must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required


" ---------- NerdTree Project Browser ----------
nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalMenu = 1


" ----------- Nerd Commenter ---------------
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1


" ---------- Enhanced C++ syntax highlighting ----------
let g:cpp_class_scope_highlight=1
let g:cpp_concepts_highlight=1
let g:cpp_experimental_simple_template_highlight=1

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

" Ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

set clipboard=unnamed


" ----------- Syntastic ----------------

" Disable pymode
let g:pymode_lint_on_write=0

let g:syntastic_check_on_open = 1
let g:syntastic_python_python_exec='python3'
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args = '--ignore=W503,E203,E501,E402'

" ----------- Black ---------------
"  Run Black when saving python files
let g:black_linelength=99

" --------- Vim Operator Flashy --------
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

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

if has('nvim')
    setlocal spell spelllang=en_us,de_ch
endif
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" -------- CoC ----------

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Disable for Python files
autocmd BufNew,BufEnter *.py execute "silent! CocDisable"

" ------ General -------
" Flag unnecessary whitespace
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h,*.cpp,*.hpp match BadWhitespace /\s\+$/

" ------ Lualine -------
"
lua << END
require('lualine').setup {
  options = { theme = 'ayu_dark' },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename'},
    lualine_c = {'branch'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactivate_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
}
END

" ########## Themes ############
" ---------- Monokai color scheme ----------
" syntax on
" colorscheme Monota

" ---------- Falcon -----------
" colorscheme falcon

" ---------- Tokyo Night -----------
"
" colorscheme tokyonight
"
" ---------- Nightfox -----------
"
" colorscheme nightfox

" ---------- Moonfly -----------
"
colorscheme moonfly

" ---------- Kanagawa -----------
"
"colorscheme kanagawa-dragon

" ---------- Everforest -----------
"
" set background=dark " dark or light
" let g:everforest_background = 'hard' "hard, medium, soft
" let g:everforest_enable_italic = 1
" let g:everforest_disable_italic_comment = 1
" colorscheme everforest
