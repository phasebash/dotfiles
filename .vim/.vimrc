set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
syntax on
set encoding=utf-8
" set listchars=tab:▸\ ,eol:¬

if has ("autocmnd")
    " Enable file type detection
    filetype on

    " syntax of these languages is  fussy over tabs vs spaces
     autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab

endif

