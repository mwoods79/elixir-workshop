# HELLO

---

# Before we start

1. Goodbye to Johnny
2. Conflicts with RubyJax
3. Workshop/Talk cycle
4. Thanks to Availity

---

# Introductions

---

# Elixir

---

# Excercise

Use `iex` like a calculator:

```elixir
iex> 1 + 1
2
iex> :math.pos(1000, 3)
1.0e9
```

---

# Sequential Programming

---

# Integers

Unbounded

```elixir
iex> fact(1000)
4023872600770937735437024339230039857193748642107146...
```

---

# Floats

Max size 1.7976931348623157e+308

```elixir
iex> 10 / 2
5.0

iex> div 10, 2
5
```

---

# Atom

Very light weight (1 word of memory)

Never garbage collected

By default, the maximum number of atoms is 1,048,576

```elixir
iex> :foo
:foo
iex> :"foo bar"
:"foo bar"
```

---

# Boolean

Just a special atom

```elixir
iex> true
true
iex> false
false
iex> nil
nil
```

---

# List

Implmented as a linked list.

List traversal is O(n)

List concat is O(1)

Lists can contain any type

```elixir
iex> [1, 2] ++ [:foo, true]
[1, 2, :foo, true]
iex> [1, 2, :foo] -- [:foo, 3]
[1, 2]
iex> :foo in [1, 2, :foo]
true
```

"Lists are poorly named stacks" -- Joe Armstrong

---

# String

Binary (sequence of bytes)

Think of it being "list like"

```eliixr
iex> baz = "foo" <> "bar"
"foobar"
iex> is_binary(baz)
true
```

---

# String (cont...)

IMPORTANT!:

Erlang uses a list of ints to represent ASCII strings

When interacting with Erlang libraries we use the single qoute syntax

```elixir
iex> 'foo'
'foo'
```

---

# Tuple

Stored contiguously in memory


```elixir
iex> bar = {:ok, 123}
{:ok, 123}
iex> elem(bar, 1)
123
```

---

# Maps

```elixir
iex> foo = %{}
%{}
iex> Map.put(foo, :bar, :baz)
%{bar: :baz}
```

---

# Pattern Matching

```elixir
iex> {:ok, name} = {:ok, "Micah"}
{:ok, "Micah"}
iex> name
"Micah"
```

---

# Functions

```elixir
iex> foo = fn bar -> bar end
#Function<6.54118792/1 in :erl_eval.expr/5>
iex> foo.("hello")
"hello"
```

---
##Now we are switching to Compiled Elixir
elixirc is a common way to compile elixir.
however, with large projects 
usually a mix file is created 
and iex is brought from the compiled code with the command:

iex -S mix
mix is a build tool.

# Modules

```elixir
defmodule Foo do
  use Bar
  alias Baz
  import Qux, only: [something: 1]

  def hello(name) when is_binary(name) do
    "Hello #{name}"
  end

  def hello({first, last}) do
    fullname = first <> last
    "Hello #{fullname}"
  end
end
```

---

# Structs

```elixir
defmodule User do
  defstruct [:first_name, :last_name]

  def name(%User{first_name: first_name, last_name: lastname}) do
    "#{first_name} #{last_name}"
  end
end
```

---

# Thinking recursively

```elixir
defmodule Basics do

  def factorial(0) do
    1
  end

  def factorial(n) when is_integer(n) and n > 0 do
    n * factorial(n-1)
  end

end
```

---
# Excercise
* Create a mix project `mix new recursion`
---
# Excercise
* Implement boolean logic
1. not
2. and
3. or
---
# Excercise
* Write a function that prints each element of a list
---
# Excercise
* Write a function that finds the length of a list
---
# Excercise
* Write a function that removes all duplicates from a list
---
# Excercise
* Write a quicksort function
---
# Excercise
* Write a mergesort function
