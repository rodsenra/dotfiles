set t_vb=
colorscheme molokai

if has("gui_running")
   set guifont=Inconsolata:h16
endif

highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" no folds
set nofoldenable

filetype on
filetype plugin on
filetype indent on

autocmd FileType python compiler pylint

set nocompatible

set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set expandtab

let mapleader = ","

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,list,full
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

set nobackup
set noswapfile

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

set wildignore=*.swp,*.bak,*.pyc,*.class
set wildignore+=*/tmp/*,*.so,*.zip   " Linux/MacOSX

set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" , <space> it disables current search 
nnoremap <leader><space> :noh<cr>

set wrap
set textwidth=79
set formatoptions=qrn1
set fuopt=maxvert,maxhorz

nmap <leader>l :set list!<CR>
set list
set listchars=tab:▸\ ,trail:·
" end of line
",eol:¬

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :
au FocusLost * :wa

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

nnoremap <leader>v V`]

nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

nnoremap <leader>w <C-w>v<C-w>l

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

au BufNewFile,BufRead *.less set filetype=less

" Removes toolbar
set guioptions-=T

augroup mkd
    autocmd BufRead,BufEnter *.mkd set ai formatoptions=tcroqn2 comments=n:&gt;
    autocmd BufRead,BufEnter *.md set ai formatoptions=tcroqn2 comments=n:&gt;
    autocmd BufRead,BufEnter *.markdown set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END

nmap <silent> <Leader>y :CtrlPMRU<CR>
nmap <silent> <Leader>t :CtrlP<CR>

" Removes trailing spaces
function! TrimWhiteSpace()
  :retab
  %s/\s*$//
  ''
:endfunction

" Open/Close NERDTree
map <F1> :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeToggle<CR>

" Eliminates useless white spaces
map <F2> :call TrimWhiteSpace()<CR>

" PEP mapping (,p is much easier than FN + F5)
let g:pep8_map='<leader>p'

" Shows hidden files in NERDTree
let NERDTreeShowHidden=1

" Removes the annoying Press ENTER or type command to continue
set shortmess=atI

nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

cmap w!! w !sudo tee % >/dev/null
