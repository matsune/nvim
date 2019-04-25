let g:deoplete#sources#rust#racer_binary='/Users/ts-matsune.yuma/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/ts-matsune.yuma/.multirust/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src'
let g:deoplete#sources#rust#show_duplicates=1
let g:deoplete#sources#rust#disable_keymap=1

au FileType rust nmap <C-]> <plug>DeopleteRustGoToDefinitionDefault
