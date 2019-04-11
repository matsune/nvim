call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')

nnoremap <silent> <C-p> :<C-u>Denite file_rec -buffer-name=search-buffer-denite <CR>
nnoremap <silent> <C-g> :<C-u>Denite grep -buffer-name=search-buffer-denite<CR>
nnoremap <silent> <C-h> :<C-u>Denite -resume -buffer-name=search-buffer-denite<CR>
nnoremap <silent> <C-l> :<C-u>Denite line -buffer-name=search_buffer-denite<CR>
