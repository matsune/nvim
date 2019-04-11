set autowrite
set updatetime=100

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

au FileType go nmap <leader>s <Plug>(go-def-split)
au FileType go nmap <leader>v <Plug>(go-def-vertical)
au FileType go setlocal foldmethod=syntax
autocmd FileType go nmap <Leader>i <Plug>(go-info)

nnoremap <silent> <C-w> :GoDecls<CR>