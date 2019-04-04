let mapleader="," "leader is comma
syntax enable "enable syntax processing

set shiftwidth=4
set softtabstop=4 "nombre d'espaces dans tab en édition
set ai "auto indent
set si "smart indent
set wrap
filetype indent on
" visual mode pressing * or # searches for current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<cr>

"map <space> to / search and ctr-space to ? (backwards search)
map <space> /
map <c-space> ?

set expandtab " tabs are spaces

set number " set nu

set showcmd "show command in bottom bar
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase

set magic
set showmatch
set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set cursorline "surligne la ligne actuelle
set wildmenu "visual autocomplétion pour le menu de commande

set lazyredraw " actualise l'écran seulement quand y a besoin

"disable hl on the fly
nnoremap <leader><cr> :noh<CR>
"save shortcut
nnoremap <leader><w> :w!<cr>
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Delete trailing white space on save, useful for Python and CoffeeScript
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"Show diff between currently edited file and its unmodified version in the FS
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
nnoremap <leader>d :DiffSave<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk
"Highlight last inserted text
nnoremap gV `[v`] 

"Fold block of {}
map <leader>ff vi{zf
map <leader>= ggvG=
set incsearch "start looking for patter as I type

set hlsearch "hl all search results
map <leader>ss :setlocal spell!<cr>
" leader m removes all ^M -
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_winsize = 25
nnoremap <leader>xx :Vexplore<cr>
