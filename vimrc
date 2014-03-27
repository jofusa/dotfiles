set nocompatible               " be iMproved
filetype off                   " required!
" copy from clipboard
set clipboard=unnamed

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'ervandew/supertab'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'chrisbra/csv.vim'


Bundle 'Syntastic' 
Bundle 'altercation/vim-colors-solarized' 
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'Shougo/neocomplcache'

" Snippets
"Bundle "http://github.com/gmarik/snipmate.vim.git"

" Syntax highlight
Bundle "cucumber.zip"
Bundle "Markdown"

" Git integration
Bundle "git.zip"
Bundle "fugitive.vim"

" (HT|X)ml tool
Bundle "ragtag.vim"


if has('python')
""    Bundle 'klen/python-mode'
    Bundle "SirVer/ultisnips"
    Bundle "jmcantrell/vim-virtualenv"
    Bundle "davidhalter/jedi-vim"
""    Bundle 'szw/rope-vim'
""    Bundle 'nvie/vim-flake8'


endif

let mapleader="," 

set mouse=a



" UltiSnips
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
nmap <Leader>rs :py UltiSnips_Manager.reset()<CR>

filetype plugin indent on 

let g:UltiSnipsEditSplit = "vertical"

nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let g:NERDTreeShowBookmarks=1
let g:NERDTreeChDirMode=2 " Change the NERDTree directory to the root node
let g:NERDTreeMinimalUI=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
  \&& b:NERDTreeType == "primary") | q | endif


if has('python')
    let g:easytags_python_enabled = 1
endif


"window shortcuts
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

syntax enable
syntax on
set t_Co=256

colorscheme distinguished 


"let g:solarized_termcolors=256

set number


set encoding=utf-8
set showcmd                     " display incomplete commands

syntax on
filetype on
" EPCG files should look like c
au BufNewFile,BufRead *.pgc set filetype=c


"" Whitespace
""set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

""Stamp shortcut S will replace word under cursor with last yanked
"" so viwy then S
"copy word under cursor
nnoremap Y viwy
"paste word under cursor
nnoremap S diw"0P


command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

"" Python Folding
"" set foldmethod=indent
"" set foldlevel=99
nnoremap <space> za
vnoremap <space> zf

" Swap ; and :  Convenient.
nnoremap ; :
"nnoremap : ;




command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction



set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
