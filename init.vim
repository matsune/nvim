if &compatible
	set nocompatible
endif

""" requires
" $ pyenv install 3.7.3
" $ pyenv virtualenv 3.7.3 neovim3
" $ pyenv activate neovim3
" $ pip install neovim
" $ pyenv which python
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	let g:rc_dir	= expand('~/.config/nvim/rc')
	let s:toml      = g:rc_dir . '/dein.toml'
	let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

	call dein#load_toml(s:toml, {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})
	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
	call dein#install()
endif

filetype plugin indent on
syntax enable

runtime! rc/options.rc.vim
runtime! rc/keymap.rc.vim

""" Solarized
"let g:solarized_termcolors=16
"syntax enable
"set background=dark
"colorscheme solarized

" GitGutter
set signcolumn=yes
GitGutterEnable

let s:nvim_dir = expand('~/.config/nvim')
let s:syntax_dir = s:nvim_dir.'/syntax'

function! s:install_syntax(filename, url)
  let s:file_dir = s:syntax_dir.'/'.a:filename
  if !filereadable(s:file_dir)
    echo 'downloading '.a:filename.' to '.s:file_dir
    call system('wget -O '.s:file_dir.' '.a:url)
  endif
endfunction

if !isdirectory(s:syntax_dir)
  call mkdir(s:syntax_dir)
endif

call s:install_syntax('vue.vim', 'https://raw.githubusercontent.com/posva/vim-vue/master/syntax/vue.vim')

"au BufRead,BufNewFile,BufReadPre *.ts set filetype=typescript

