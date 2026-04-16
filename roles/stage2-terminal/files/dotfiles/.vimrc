
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
Plug 'gruvbox-community/gruvbox'
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'nvim-lua/plenary.nvim'
Plug 'dense-analysis/ale'
Plug 'nvim-lua/plenary.nvim'
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax / Highlight / Visual / Audio / etc. 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set number
set relativenumber
colorscheme gruvbox
set background=dark
set signcolumn=yes
set colorcolumn=80
set cursorline
set noeb vb t_vb=
set noerrorbells
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs / Indent / Wrap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set wrap
set hlsearch
set incsearch
set ignorecase
set smartcase
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits / Buffers 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow
set splitright
set hidden
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status bar 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some type specific configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "
filetype on
filetype plugin on
filetype indent on
augroup filetype
  autocmd BufNewFile,BufRead *.txt set filetype=human
augroup END
autocmd FileType human set formatoptions-=t textwidth=0 
autocmd FileType html,xhtml,css,xml,xslt set shiftwidth=2 softtabstop=2 
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigate files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree"
nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stay indented
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap < <gv
vnoremap > >gv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Motions 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quit"
nnoremap <C-q> :qall<CR>
" Buffer"
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
" Line numbers
nnoremap <leader># :set rnu!<CR>
" Splits
nnoremap <leader>ss :split<CR>
nnoremap <leader>vv :vsplit<CR>
" 1/2 Page jump
nnoremap <C-d> <C-d>zz          " Cursor half page down (centered)
nnoremap <C-u> <C-u>zz          " Cursor half page up (centered)
" Other
nnoremap "<leader>p" "\"_dP     " Keep copy
tnoremap <Esc> <C-\><C-n>       " Escape terminal 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line swap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://stackoverflow.com/questions/741814/move-entire-line-up-and-down-in-vim
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction
function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif
    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction
function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif
    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction
noremap <silent> <c-s-up> :call <SID>swap_up()<CR>
noremap <silent> <c-s-down> :call <SID>swap_down()<CR>
