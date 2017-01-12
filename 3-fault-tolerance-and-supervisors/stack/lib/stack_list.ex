defmodule StackList do

  def start_link(opts \\ []) do
    Agent.start_link(fn -> %{} end, opts)
  end

  def find_stack(name) do
    Agent.get(__MODULE__, fn list_of_stacks ->
      Map.fetch(list_of_stacks, name)
    end)
  end

  def update(name, pid) do
    Agent.update(__MODULE__, fn list_of_stacks -> Map.update(list_of_stacks, name, pid, fn _value -> pid end) end)
  end
end
