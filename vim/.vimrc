set encoding=utf-8

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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

autocmd InsertLeave * write

" jj is the new esc
:imap jj <Esc>

colorscheme elflord
highlight Pmenu guibg=brown gui=bold
highlight CocFloating ctermbg=7

nmap <silent> ,t :TestNearest<CR>
nmap <silent> ,T :TestFile<CR>
nmap <silent> ,a :TestSuite<CR>
nmap <silent> ,l :TestLast<CR>
nmap <silent> ,g :TestVisit<CR>

nmap <silent> ,s :lclose<CR>

nmap <leader>g :NERDTreeToggle<CR>
nmap <leader>G :NERDTreeFind<CR>

let g:rustfmt_autosave = 1
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

set omnifunc=syntaxcomplete#Complete

" =====================================================
"
" COC settings from https://github.com/neoclide/coc.nvim
" 
" =====================================================

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" =====================================================
"
" /COC
"
" =====================================================

call plug#begin('~/.vim/plugged')

call plug#begin()
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
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neoclide/coc-tsserver'
    Plug 'neoclide/coc-rls'
    Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
    " needs
    " :CocInstall coc-rls
    " rustup component add rls rust-analysis rust-src
call plug#end()
