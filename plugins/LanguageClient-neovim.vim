set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'vue': ['vls'],
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ }

nmap <leader>v :call LanguageClient#textDocument_definition({'gotoCmd': 'split'})<CR>
nmap <C-]> :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

let g:LanguageClient_useFloatingHover = 1
