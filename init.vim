""" No Swap File
set noswapfile

""" Syntax
syntax on

if !&diff
    """ Colors
    colorscheme zenburn
endif
set background=dark

""" Set the Leader
let mapleader=","

""" History
set history=1000

""" Encoding
set encoding=utf-8

""" Filetypes
filetype plugin on
filetype plugin indent on
au BufNewFile,BufRead *.kv set filetype=kv

""" Indentation
set autoindent
set smartindent


""" Allow copy/pasting using X
set mouse=v
""" No line number selection
"set mouse=a

""" Toggle colored right border after 79 chars
set colorcolumn=79
let s:color_column_old=0
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

""" Line numbers and ruler
set number
set ruler

""" Whitespace
set list listchars=tab:→\ ,trail:·

""" Tabs and spaces
set smarttab
set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent

""" Conserve sanity
cmap W w
cmap Q q

" Reselect visual block after in/dedent so we can in/dedent more
vnoremap < <gv
vnoremap > >gv

""" Disable Help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

""" Editor tabs
nnoremap <leader>t :tabe<cr>
nnoremap <leader>c :tabclose<cr>
nnoremap ‘ :tabn<cr>
nnoremap “ :tabp<cr>
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <leader>f :Te<cr>
nnoremap <leader>n :tabe<cr>

""" Filetypes
filetype on
au BufNewFile,BufRead *.asm set filetype=asmone
au BufNewFile,BufRead *.s set filetype=asmone
au BufNewFile,BufRead *.vcl set filetype=vcl
au BufNewFile,BufRead *.c set filetype=c
au BufRead,BufNewFile *.kt  set filetype=kotlin
au BufRead,BufNewFile *.jet set filetype=kotlin
au BufRead,BufNewFile *.sls set filetype=yaml
au BufRead,BufNewFile *.rs set filetype=rust
au BufRead,BufNewFile *.toml set filetype=toml
au BufRead,BufNewFile *.html set filetype=html
au BufRead,BufNewFile *.js set filetype=javascript
au BufRead,BufNewFile *.md set filetype=markdown

" Diff
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

""" Shortcuts
" Vertical buffers
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>o <C-w>n<C-w>l
nnoremap <leader>w <C-w>c
nnoremap <leader>/ <C-w>w

"Reformat
nnoremap <leader>, mzgg=G`z

" Easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-Up> <c-w>k
nnoremap <c-Down> <c-w>j
nnoremap <c-Left> <c-w>h
nnoremap <c-Right> <c-w>l<Paste>

" Go-into
nnoremap <leader>g <c-w><c-f>

" Make
nnoremap <leader>m :make<cr>

" Paste/No-paste
function! PasteToggle()
    if &paste
        set nopaste
    else
        set paste
    endif
endfunc

nnoremap <C-p> :call PasteToggle()<cr>

""" Remove trailing whitespace
nnoremap <silent> <Leader>. :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

""" Back to previous line
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

""" Save all and quit
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>Q :wqa!<cr>

""" Linux Coding Style
nnoremap <silent> <leader>k :LinuxCodingStyle<cr>

""" Indentation for file-type
autocmd FileType kv setlocal shiftwidth=4 tabstop=4

""" Airline theme
:let g:airline_theme='zenburn'
:let g:airline_powerline_fonts = 1
set noshowmode

""" Python-mode
let g:pymode_folding = 0
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_warnings = 1
let g:pymode_doc = 0
let g:pymode_doc_bind = 'K'
let g:pymode_run_bind = '<leader>r'
let g:pymode_rope = 0
let g:pymode_lint_on_write = 1

""" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""" Java
autocmd FileType java setlocal omnifunc=javacomplete#Complete

if !&diff
    """ vim-plug
    call plug#begin('~/.vim-plugged')

    " Group dependencies, vim-snippets depends on ultisnips
    Plug 'vivien/vim-linux-coding-style'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-fugitive'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'farfanoide/vim-kivy'
    " Plug 'python-mode/python-mode'
    Plug 'hynek/vim-python-pep8-indent'
    Plug 'pangloss/vim-javascript'
    Plug 'moll/vim-node'
    Plug 'ekalinin/Dockerfile.vim'
    " Plug 'artur-shaik/vim-javacomplete2'

    call plug#end()
endif
