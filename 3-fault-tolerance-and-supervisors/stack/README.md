# Implementation
<pre>
mix deps.get
iex -S mix

</pre>
## Example of implementation taken from test file:
<pre>
{:ok, pid} = Stack.start_link
Stack.push pid, :bar
Stack.push pid, :foo
Stack.pop(pid) == :foo
Stack.size(pid)
</pre>

## How to run the test suite
<pre>
mix test
</pre>
# How to find module and functions when using iex
<pre>
Learn module name by first capital letter of module and tab...

Then when you type the module
tab will tell function names.
</pre>
# Stack

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `stack` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:stack, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/stack](https://hexdocs.pm/stack).
