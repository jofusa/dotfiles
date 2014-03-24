set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'ervandew/supertab'
Bundle 'kien/ctrlp.vim'


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


" UltiSnips
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
nmap <Leader>rs :py UltiSnips_Manager.reset()<CR>


"Command T mapping
noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

filetype plugin indent on 

let g:UltiSnipsEditSplit = "vertical"

nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let g:NERDTreeShowBookmarks=1
let g:NERDTreeChDirMode=2 " Change the NERDTree directory to the root node
let g:NERDTreeMinimalUI=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
  \&& b:NERDTreeType == "primary") | q | endif



"let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_enable_camel_case_completion = 0 " Enable camle case completion
"let g:neocomplcache_omni_functions = {
"      \ 'python' : 'RopeCompleteFunc',
"     \ }

if has('python')
    let g:easytags_python_enabled = 1
endif


" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ neocomplcache#start_manual_complete()



" colorscheme slate
set number


syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands

syntax on
filetype on
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
nnoremap S diw"0P

"" Python Folding
"" set foldmethod=indent
"" set foldlevel=99
nnoremap <space> za

vnoremap <space> zf

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



" Load rope plugin
let g:pymode_rope = 1

" Auto create and open ropeproject
let g:pymode_rope_auto_project = 1

" Enable autoimport
let g:pymode_rope_enable_autoimport = 1

" Auto generate global cache
let g:pymode_rope_autoimport_generate = 1


let g:pymode_rope_autoimport_underlineds = 0

let g:pymode_rope_codeassist_maxfixes = 10

let g:pymode_rope_sorted_completions = 1

let g:pymode_rope_extended_complete = 1

let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]

let g:pymode_rope_confirm_saving = 1

let g:pymode_rope_global_prefix = "<C-x>p"

let g:pymode_rope_local_prefix = "<C-c>r"

let g:pymode_rope_vim_completion = 1

let g:pymode_rope_guess_project = 1

let g:pymode_rope_goto_def_newwin = ""

let g:pymode_rope_always_show_complete_menu = 0

" Enable python folding
let g:pymode_folding = 0


" Load pylint code plugin
let g:pymode_lint = 0
let g:pymode_lint_ignore = "E501"

let g:PyLintCWindow = 0
let g:PyLintDissabledMessages = 'C0103,C0111,C0301,W0141,W0142,W0212,W0221,W0223,W0232,W0401,W0613,W0631,E1101,E1120,R0903,R0904,R0913'


"" Python Folding
"" set foldmethod=indent
"" set foldlevel=99
nnoremap <space> za

vnoremap <space> zf



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
