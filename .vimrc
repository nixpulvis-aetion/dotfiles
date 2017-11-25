set nocompatible

call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/webapi-vim'
Plug 'vim-syntastic/syntastic'
Plug 'gabrielelana/vim-markdown'
Plug 'vim-latex/vim-latex'
Plug 'rust-lang/rust.vim'
Plug 'timonv/vim-cargo'
Plug 'Valloric/YouCompleteMe'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tomasr/molokai'
Plug 'sickill/vim-monokai'
Plug 'joshdick/onedark.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'chrisbra/Colorizer'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/Align'
call plug#end()

:silent call system('mkdir -p $HOME/.vim/undo')
set undodir=$HOME/.vim/undo
set undofile

syntax enable
colorscheme onedark

set noshowmode
set laststatus=2
let g:lightline = {
 \   'colorscheme': 'onedark',
 \ }

:set number
:set cursorline
:hi cursorline cterm=none
:hi cursorlinenr ctermfg=red
:hi LineNr ctermbg=236

" Clipboard support
set clipboard=unnamed

" Folding
set nofoldenable

" Indentation
set expandtab
set shiftwidth=4
set tabstop=4
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

" Vim command tab completion.
set wildmode=longest,list,full
set wildmenu

" Syntax checking.
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" Spell checking.
:map <F5> :setlocal spell! spelllang=en_us<CR>

" Markdown
let g:tex_conceal = 0
let g:vim_markdown_math = 1

" Rust configuration.
let g:ycm_rust_src_path = '$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWrite *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" <bar> redraw!
