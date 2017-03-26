# WELCOME

---

# Before we start

1. Thanks to Availity
2. Looking for speakers
3. Workshop/Talk cycle

---

# Introductions

---

# Workshop 4
# Macros

---

# Plug

---

# Example
* plug application

---

# Excercise
* implement plug router

```elixir
def call(conn, _opts) do
  route(conn.method, conn.path_info, conn)
end

def route("GET", ["hello"], conn) do
  # this route is for /hello
  conn |> send_resp(200, "Hello, world!")
end
```

---

# Macros

* qoute
* unqoute
* __using__

---

# Example
* create a `Router` module

---

# Excercise
* write a macro for `get` requests

```elixir
defmodule Hello do
  use Router

  get "/hello" do
    conn |> send_resp(200, "Hello, world!")
  end
end
```

---
# Example
* use Plug.Builder to create a pipeline

# Reading

* Programming Elixir
* Elixir in Action
* Macros book * todo

---

# See Ya

@mwoods79
micahwoods@gmail.com
