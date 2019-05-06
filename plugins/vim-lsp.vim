if executable('go-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'go-langserver',
        \ 'cmd': {server_info->['go-langserver', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
endif

au FileType go nmap <leader>s :split \| :LspDefinition <CR>
au FileType go nmap <leader>v :vsplit \| :LspDefinition <CR>
au FileType go nmap <C-]> :LspDefinition<CR>
