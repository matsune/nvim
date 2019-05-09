set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'go': [$GOPATH.'/bin/go-langserver','-format-tool','gofmt','-lint-tool','golint'],
    \ }

au FileType rust nmap <leader>v :call LanguageClient#textDocument_definition({'gotoCmd': 'split'})<CR>
nmap <C-]> :call LanguageClient#textDocument_definition()<CR>

let g:LanguageClient_useFloatingHover = 1
" Automatic Hover
function! DoNothingHandler(output)
endfunction

function! IsDifferentHoverLineFromLast()
  if !exists('b:last_hover_line')
    return 1
  endif

  return b:last_hover_line !=# line('.') || b:last_hover_col !=# col('.')
endfunction

function! GetHoverInfo()
  " Only call hover if the cursor position changed.
  "
  " This is needed to prevent infinite loops, because hover info is displayed
  " in a popup window via nvim_buf_set_lines() which puts the cursor into the
  " popup window and back, which in turn calls CursorMoved again.
  if mode() == 'n' && IsDifferentHoverLineFromLast()
    let b:last_hover_line = line('.')
    let b:last_hover_col = col('.')

    call LanguageClient_textDocument_hover({'handle': v:true}, 'DoNothingHandler')
    call LanguageClient_clearDocumentHighlight()
    call LanguageClient_textDocument_documentHighlight({'handle': v:true}, 'DoNothingHandler')
  endif
endfunction

augroup LanguageClient_config
  autocmd!
  autocmd CursorMoved * call GetHoverInfo()
  autocmd CursorMovedI * call LanguageClient_clearDocumentHighlight()
augroup end
