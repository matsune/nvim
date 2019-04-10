set autowrite
let g:go_fmt_command = "goimports"
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1
set updatetime=100

au FileType go setlocal foldmethod=syntax

