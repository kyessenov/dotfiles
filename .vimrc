runtime! debian.vim
syntax on

execute pathogen#infect()

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
set clipboard=unnamed   " X clipboard
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

" Don't put swap files in the same directory as "."
set directory-=.

" Gnome terminal has 256 color support; use 256-color supporting color scheme
set t_Co=256

" Color scheme
set background=light
colorscheme lucius
LuciusWhite

" GUI
if has('gui_running')
  if has('gui_macvim')
    set guifont=Ubuntu\ Mono\ derivative\ Powerline:h16
  else
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 14
  endif
  set guioptions=i
  set guicursor=a:blinkon0
  " autocmd GUIEnter * highlight Normal guibg=#333333
  " autocmd GUIEnter * highlight NonText guifg=bg
  autocmd GUIEnter * set vb t_vb=
endif

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

" Neocomplete (insert mode mappings)
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-g>  neocomplete#undo_completion()
inoremap <expr><C-l>  neocomplete#complete_common_string()

" Airline plugin
let g:airline_powerline_fonts=1
let g:airline_detect_whitespace=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='lucius'

" LaTeX
let g:tex_flavor="latex"
let g:vimtex_latexmk_build_dir = '/tmp/latex'
let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
  let g:vimtex_view_general_viewer = $HOME.'/Applications/Skim.app/Contents/SharedSupport/displayline'
  let g:vimtex_view_general_options = '@line @pdf @tex'
endif
autocmd FileType tex execute 'setlocal complete+=k'.$HOME.'/.vim/dictionaries/latex.txt'

" Indent Python in the Google way.
setlocal indentexpr=GetGooglePythonIndent(v:lnum)
let s:maxoff = 50 " maximum number of lines to look backwards.
function GetGooglePythonIndent(lnum)
  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)
endfunction

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"

" Golang
autocmd BufRead,BufNewFile *.go setlocal noexpandtab
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go hi goSameId term=bold cterm=bold ctermbg=231
let g:go_auto_type_info = 1
" Causes issues with showing artifacts on screen
" let g:go_auto_sameids = 1
let g:go_dispatch_enabled = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_def_mode = 'godef'
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
