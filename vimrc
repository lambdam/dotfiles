" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neobundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Check on https://github.com/Shougo/neobundle.vim

if has('vim_starting')
 set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

"" Put bundle here
"
""" Note: You don't set neobundle setting in .gvimrc!
""" Original repos on github
" NeoBundle 'tpope/vim-fugitive'
""" vim-scripts repos
" NeoBundle 'FuzzyFinder'
""" Non github repos
" NeoBundle 'git://git.wincent.com/command-t.git'
""" Non git repos
" NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'jeetsukumaran/vim-buffergator.git'
NeoBundle 'airblade/vim-gitgutter.git'
NeoBundle 'kien/ctrlp.vim.git'
NeoBundle 'vim-scripts/AutoComplPop.git'
NeoBundle 'bronson/vim-trailing-whitespace.git'
NeoBundle 'terryma/vim-multiple-cursors.git'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'Raimondi/delimitMate.git'
NeoBundle 'kchmck/vim-coffee-script.git'
NeoBundle 'mileszs/ack.vim.git'
NeoBundle 'tyok/nerdtree-ack.git'
NeoBundle 'LStinson/TagmaBufMgr.git'
"NeoBundle 'fholgado/minibufexpl.vim.git'
NeoBundle 'tpope/vim-haml.git'

NeoBundle 'tomasr/molokai.git'

filetype plugin indent on
NeoBundleCheck

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on

" set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

" Disable error bell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Disable all blinking:
set guicursor+=a:blinkon0

" Highlight line and column of cursor
set cursorline cursorcolumn

" Display line numbers
set number

"" Mouse
set mouse=a
set mousehide

" set hlsearch
set showmatch
" set incsearch
" set ignorecase
" set nowrap
set autoindent
set history=1000
" if has("unnamedplus")
"   set clipboard=unnamedplus
" elseif has("clipboard")
"   set clipboard=unnamed
" endif

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" 80 chars code
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Scheme 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" !!! Note if iTerm doesn't dislay colors well :
" Preferences -> Profiles -> Terminal
"   -> Report Terminal Type : xterm-256color

colorscheme molokai

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" NERDTree
" Auto open on startup
autocmd vimenter * if !argc() | NERDTree | endif
" Close VIM if NERDTree is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-b> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ctrlp_custom_ignore = { 'dir': 'node_modules\|tmp' }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Buffers
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

"" Windows
nmap <C-Left> <C-W><Left>
nmap <C-Right> <C-W><Right>
nmap <C-Up> <C-W><Up>
nmap <C-Down> <C-W><Down>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.hamlc set filetype=haml

