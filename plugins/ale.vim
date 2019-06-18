let g:ale_linters = {
\ 'go': ['golangci-lint'],
\}

call ale#Set('go_golangci_lint_package', 1)
call ale#Set('go_golangci_lint_options', './...')
