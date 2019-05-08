# nvim
```sh
$ git clone git@github.com:matsune/nvim.git ~/.config/nvim
```

```sh
# .zshrc
export XDG_CONFIG_HOME=$HOME/.config
```

## langserver
### Go(go-langserver)
```sh
go get -u golang.org/x/tools/cmd/gopls
go get -u github.com/sourcegraph/go-langserver
go get -u github.com/saibing/bingo
```

### Rust(RLS)
```sh
rustup update
rustup component add rls rust-analysis rust-src
```

