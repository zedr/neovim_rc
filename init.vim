""" No Swap File
set noswapfile

""" Syntax
syntax on

""" Colors
colorscheme zenburn
set background=dark

""" Set the Leader
let mapleader=","

""" History
set history=1000

""" Encoding
set encoding=utf-8

""" Filetypes
set autoindent
filetype plugin on
filetype plugin indent on

""" Autoindent
set ai

""" Allow copy/pasting using X
set mouse=v

""" Toggle colored right border after 79 chars
set colorcolumn=79
let s:color_column_old=0
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

""" Line numbers and ruler
set number
set ruler

""" Tabs and spaces
"set expandtab           " enter spaces when tab is pressed
"set tabstop=4           " use 4 spaces to represent tab
"set softtabstop=4
"set shiftwidth=4        " number of spaces to use for auto indent

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

""" Filetypes
filetype on
au BufNewFile,BufRead *.asm set filetype=asmone
au BufNewFile,BufRead *.s set filetype=asmone
au BufNewFile,BufRead *.vcl set filetype=vcl
au BufRead,BufNewFile *.kt  set filetype=kotlin
au BufRead,BufNewFile *.jet set filetype=kotlin
au BufRead,BufNewFile *.sls set filetype=yaml
au BufRead,BufNewFile *.rs set filetype=rust
au BufRead,BufNewFile *.toml set filetype=toml
au BufRead,BufNewFile *.html set filetype=html
au BufRead,BufNewFile *.js set filetype=javascript
au BufRead,BufNewFile *.md set filetype=mkd

" C
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

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
nnoremap <leader>, <C-w>w

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
nnoremap <leader>q :qa<cr>
nnoremap <leader>Q :wqa!<cr>

""" Airline theme
:let g:airline_theme='zenburn'
:let g:airline_powerline_fonts = 1
set noshowmode

""" vim-plug
call plug#begin('~/.vim-plugged')

" Group dependencies, vim-snippets depends on ultisnips
Plug 'vivien/vim-linux-coding-style'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

call plug#end()
