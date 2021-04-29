# GoLang

GoLang is a common programming language.

## Installation

To get go working you basically just need to install [Go](https://golang.org/doc/install).
Make sure to set the `GOPATH` and the `GOBIN` variable and add the last to the `Path`
by adding the following to your `.profile`:

```sh
export GOPATH="${HOME}/go"
export GOBIN="${GOPATH}/bin"
export PATH="${GOBIN}:${PATH}"
```

You can move the `GOPATH` where you want.

## IDE

### Vim

The steps to make Vim a Go IDE are described in [the vim section of this wiki](../linux/vim/golang.md).
