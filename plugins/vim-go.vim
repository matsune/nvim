set autowrite
set updatetime=100

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_decls_mode = 'ctrlp'
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

au FileType go setlocal foldmethod=syntax
autocmd FileType go nmap <Leader>i <Plug>(go-info)

au FileType go nnoremap <silent> <C-w> :GoDecls<CR>
