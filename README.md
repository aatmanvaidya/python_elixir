# PythonElixir

1. create exlir app
```sh
mix new python_elixir
cd python_elixir
```

2. install packages
```sh
mix deps.get
mix deps.compile
```
```sh
rm -rf _build deps .elixir_ls && mix deps.get && mix compile
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `python_elixir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:python_elixir, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/python_elixir>.

