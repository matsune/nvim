" Golang
if executable('gopls')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
endif
if executable('go-langserver')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'go-langserver',
        \ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
        \ 'whitelist': ['go'],
        \ })
endif
if executable('bingo')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'bingo',
        \ 'cmd': {server_info->['bingo', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
endif
au FileType go nmap <leader>s :split \| :LspDefinition <CR>
au FileType go nmap <leader>v :vsplit \| :LspDefinition <CR>
au FileType go nmap <C-]> :LspDefinition<CR>

" Rust
if executable('rls')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif
au FileType rust nmap <leader>s :split \| :LspDefinition <CR>
au FileType rust nmap <leader>v :vsplit \| :LspDefinition <CR>
au FileType rust nmap <C-]> :LspDefinition<CR>

