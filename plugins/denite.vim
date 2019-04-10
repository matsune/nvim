call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')

nnoremap <silent> <C-p> :<C-u>Denite file_rec<CR>

nnoremap <silent> <C-g> :<C-u>Denite grep<CR>
nnoremap <silent> <C-f> :<C-u>Denite line<CR>
