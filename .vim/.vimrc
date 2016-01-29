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

" Enable file type detection
filetype on

"in makefiles, don't expand tabs to spaces, since actual tab characters are
"needed, and have indentation at 8 chars to be sure that all indents are tabs
"(despite the mappings later):
autocmd FileType make     set noexpandtab shiftwidth=8
autocmd FileType automake set noexpandtab shiftwidth=8
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

