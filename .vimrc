set nocompatible

" Install plug if it's not already installed.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Bring in a bunch of packages.
call plug#begin()
Plug 'jiangmiao/auto-pairs'  " TODO
Plug 'airblade/vim-gitgutter'
Plug 'mattn/webapi-vim'  " TODO
Plug 'gabrielelana/vim-markdown'
Plug 'vim-latex/vim-latex'
Plug 'rust-lang/rust.vim'
Plug 'timonv/vim-cargo'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-commentary'  " TODO
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'  " TODO
Plug 'rakr/vim-one'
Plug 'terryma/vim-multiple-cursors'  " TODO
Plug 'ntpeters/vim-better-whitespace'  " TODO
Plug 'Yggdroot/indentLine'  " TODO
Plug 'scrooloose/nerdtree'  " TODO
Plug 'majutsushi/tagbar'  " TODO
Plug 'mbbill/undotree'  " TODO
Plug 'chrisbra/Colorizer'  " TODO
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/Align'  " TODO
call plug#end()

" Highlight search matches.
set hlsearch
" Map Ctrl-/ to clear highlighting.
" NOTE: It's very strange that <C-_> is vim's way of saying this.
nnoremap <silent> <C-_> :nohl<CR>

" Persist undos.
:silent call system('mkdir -p $HOME/.vim/undo')
set undodir=$HOME/.vim/undo
set undofile

" Use 24-bit colors (required for the 'one' theme to work).
set termguicolors

" Setup the color theme.
syntax enable
set background=dark
colorscheme one

" Configure lightline to always show.
" TODO: Git information in lightline.
set noshowmode
set laststatus=2
let g:lightline = { 'colorscheme': 'one' }

" Add a numberline gutter.
:set number

" Highlight the line the cursor is on.
:set cursorline

" Editor width configuration.
" TODO: Reconsider sidescroll.
set colorcolumn=80
set textwidth=0
set wrap

" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v', 'c']
  for key in ['<up>', '<down>', '<left>', '<right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" Bind vim style movement keys for command mode.
cnoremap <C-h> <left>
cnoremap <C-j> <down>
cnoremap <C-k> <up>
cnoremap <C-l> <right>

" Bind standard movement C-a for moving to the start of the line.
" C-e is already bound.
cnoremap <C-a> <C-b>

" Bind F1 to look up under the cursor.
" TODO: This fails if nothing is under the cursor.
nnoremap <F1> :help <C-r><C-w><CR>

" Clipboard support
set clipboard=unnamed

" Folding
set nofoldenable

" Indentation
set expandtab
set shiftwidth=4
set tabstop=4

" TODO: Let's stop using various tab sizes.
filetype plugin on
filetype plugin indent on
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType eruby setlocal tabstop=2 shiftwidth=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2
autocmd FileType scss setlocal tabstop=2 shiftwidth=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2

" Allow clicking with the mouse.
set mouse=a

" Allow subshells to detect running in vim.
let $INSIDE='vim'

" Vim command tab completion.
set wildmode=longest,list,full
set wildmenu

" Spell checking.
:map <F5> :setlocal spell! spelllang=en_us<CR>

" Markdown
let g:vim_markdown_conceal = 0
let g:tex_conceal = 0
let g:vim_markdown_math = 1

