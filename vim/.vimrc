
call plug#begin('~/.vim/plugged')

call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'w0rp/ale'
    Plug 'vim-test/vim-test'

    " elixir
    Plug 'slashmili/alchemist.vim'"
    Plug 'elixir-editors/vim-elixir'

    Plug 'rust-lang/rust.vim'
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'

    Plug 'neoclide/coc-tsserver'

    Plug 'tpope/vim-fugitive'
    Plug 'racer-rust/vim-racer'
call plug#end()

syntax enable
filetype plugin indent on

"in makefiles, don't expand tabs to spaces, since actual tab characters are
"needed, and have indentation at 8 chars to be sure that all indents are tabs
"(despite the mappings later):
autocmd FileType make     set noexpandtab shiftwidth=8
autocmd FileType automake set noexpandtab shiftwidth=8
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType typescript setlocal ts=2 sts=2 sw=2

set autochdir
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
syntax on
set encoding=utf-8
set listchars=tab:▸\ ,eol:¬
set list
set number

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

" jj is the new esc
:imap jj <Esc>

colorscheme elflord

nmap <silent> ,t :TestNearest<CR>
nmap <silent> ,T :TestFile<CR>
nmap <silent> ,a :TestSuite<CR>
nmap <silent> ,l :TestLast<CR>
nmap <silent> ,g :TestVisit<CR>

nmap <silent> ,s :lclose<CR>

nmap <leader>g :NERDTreeToggle<CR>
nmap <leader>G :NERDTreeFind<CR>

let g:rustfmt_autosave = 1

let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
"set omnifunc=ale#completion#OmniFunc
set omnifunc=syntaxcomplete#Complete

augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    "autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
    autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
augroup END
