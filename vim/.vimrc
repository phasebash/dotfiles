
set encoding=utf-8

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

syntax enable
filetype plugin indent on

"in makefiles, don't expand tabs to spaces, since actual tab characters are
"needed, and have indentation at 8 chars to be sure that all indents are tabs
"(despite the mappings later):
autocmd FileType make     set noexpandtab shiftwidth=8
autocmd FileType automake set noexpandtab shiftwidth=8
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType typescript setlocal ts=2 sts=2 sw=2

"set autochdir
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

set mouse=a
set mousemodel=popup_setpos

" jj is the new esc
:imap jj <Esc>

colorscheme elflord
"highlight Pmenu guibg=brown gui=bold
"highlight CocFloating ctermbg=7
"
" reload vim config
nnoremap confr :source $MYVIMRC<CR>

" vim test
nmap <silent> ,t :TestNearest<CR>
nmap <silent> ,T :TestFile<CR>
nmap <silent> ,a :TestSuite<CR>
nmap <silent> ,l :TestLast<CR>
nmap <silent> ,g :TestVisit<CR>

nmap <silent> ,s :lclose<CR>

" nerd tree
nmap <leader>g :NERDTreeToggle<CR>
nmap <leader>G :NERDTreeFind<CR>

" on save hooks
autocmd InsertLeave * write
let g:rustfmt_autosave = 1
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

" auto complete on
"set omnifunc=syntaxcomplete#Complete

" vim-ale
let g:ale_open_list = 1                 " show errors in window
let g:ale_keep_list_window_open = 0     " keep the windows open

let g:ale_set_highlights = 1
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {}
let g:ale_linters.scss = ['stylelint']
let g:ale_linters.css = ['stylelint']
let g:ale_linters.elixir = ['elixir-ls', 'credo']
let g:ale_linters.ruby = ['rubocop', 'ruby', 'solargraph']


let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fixers.javascript = ['eslint', 'prettier']
let g:ale_fixers.html = ['prettier']
let g:ale_fixers.scss = ['stylelint']
let g:ale_fixers.css = ['stylelint']
let g:ale_fixers.elm = ['format']
let g:ale_fixers.ruby = ['rubocop']
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_fixers.elixir = ['mix_format']
let g:ale_fixers.xml = ['xmllint']

let g:ale_sign_column_always = 1
let g:ale_elixir_credo_strict = 1

" https://www.mitchellhanberg.com/post/2018/10/18/how-to-use-elixir-ls-with-vim/
let g:ale_elixir_elixir_ls_release = expand("~/workspace/github/elixir-ls/rel")
let g:ale_elixir_elixir_ls_config = {'elixirLS': {'dialyzerEnabled': v:true}}

nmap <silent> ,h :ALEHover<CR>
nmap <silent> gd :ALEGoToDefinition<CR>
nmap <silent> gr :ALEFindReferences<CR>
nmap <silent> ]g :ALENext<CR>
nmap <silent> [g :ALEPrevious<CR>
"nmap <leader> rn :ALERename<CR>
nmap <silent> ,r :ALERename<CR>


call plug#begin('~/.vim/plugged')
" file management
Plug 'preservim/nerdtree'

"test support"
Plug 'vim-test/vim-test'

" elixir
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'

" rust
Plug 'rust-lang/rust.vim'

" git
Plug 'tpope/vim-fugitive'

" extended language support
Plug 'dense-analysis/ale'
Plug 'elixir-editors/vim-elixir'
call plug#end()
