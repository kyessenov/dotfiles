call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'
call plug#end()

syntax on

" Return to last position when opening a file
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal g'\"" | endif
filetype plugin indent on

" Save on focus lost
" au FocusLost * silent! wa

set nocompatible
set autoindent          " Copy indent from the line above
set autoread            " Reload files changed outside of VIM
set autowrite           " Automatically save before commands like :next and :make
set smartindent         " Set smart-indent
set nonu                " Line numbers
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set hlsearch            " Highlight search results
set hidden              " Hide buffers when they are abandoned
set mouse=a             " Enable mouse usage (all modes) in terminals
set visualbell t_vb=    " Disable visual bell
set wildmenu            " Show auto completion proposals in command line
set backspace=2         " Fix delete button on Mac
set clipboard=unnamedplus   " Use system clipboard
set modeline            " Executable mode lines
set noshowmode
set laststatus=2
set ttimeoutlen=50      " Fast typing in vim
set spelllang=en        " Set spell language
set spellfile=~/.vim/spell/en.utf-8.add
set ts=2                " Set tab width
set sts=2               " Backspace deletes that many characters
set shiftwidth=2        " Same for shift width
set expandtab           " Expand tab into spaces
set completeopt=longest,menuone,preview
set foldlevel=999       " Expand all folds by default
set ttyfast             " Fast terminal
set lazyredraw          " Skip refreshing screen during macros
set list                " Highlight whitespace
set lcs=trail:•,tab:··  " Trailing space
" set path+=$PWD/**

" Set file type by extension
autocmd BufRead,BufNewFile *.als setfiletype alloy4
autocmd BufRead,BufNewFile *.sk setfiletype java
autocmd BufRead,BufNewFile *.bpl setfiletype boogie
autocmd BufRead,BufNewFile *.dfy setfiletype dafny
autocmd BufRead,BufNewFile *.chalice setfiletype chalice
autocmd BufRead,BufNewFile *.sbt setfiletype scala
autocmd BufRead,BufNewFile *.scala setlocal foldmethod=indent
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufEnter *.tex set spell

" Disable backups
set nobackup
set noswapfile
let g:netrw_dirhistmax=0
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" Don't put swap files in the same directory as "."
set directory-=.

" Get truecolors
set termguicolors

" Color scheme
set background=light
let g:lucius_use_bold=1
let g:lucius_use_underline=1
colorscheme lucius
LuciusWhite
hi Comment gui=italic cterm=italic

" Macros
let mapleader = ","
let maplocalleader = ","

nnoremap <Leader><Leader> <C-^>
nnoremap <Leader><space> :b<space>
nnoremap <Leader>1 :b 1<Cr>
nnoremap <Leader>2 :b 2<Cr>
nnoremap <Leader>3 :b 3<Cr>
nnoremap <Leader>4 :b 4<Cr>
nnoremap <Leader>5 :b 5<Cr>
nnoremap <Leader>6 :b 6<Cr>
nnoremap <Leader>7 :b 7<Cr>
nnoremap <Leader>8 :b 8<Cr>
nnoremap <Leader>9 :b 9<Cr>
nnoremap <Leader>a :cclose<Cr>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

imap <C-d> <Del>
nnoremap j gj
nnoremap k gk
"nnoremap <Down> gj
"nnoremap <Up> gk
"inoremap <Down> <C-o>gj
"inoremap <Up> <C-o>gk

" Airline plugin
let g:airline_powerline_fonts=1
let g:airline_detect_whitespace=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='lucius'

" Golang
autocmd BufRead,BufNewFile *.go setlocal noexpandtab
autocmd BufRead,BufNewFile *.tmpl set filetype=gotexttmpl
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>B <Plug>(go-test-compile)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>z <Plug>(go-coverage)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>s <Plug>(go-sameids)

let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_dispatch_enabled = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "gofmt"
let g:go_def_mode = 'godef'
let g:go_metalinter_autosave = 0
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave_enabled = ['vet', 'golint']


