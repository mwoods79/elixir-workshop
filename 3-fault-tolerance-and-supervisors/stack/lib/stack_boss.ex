defmodule StackBoss do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_opts) do
    children = [
      supervisor(StackSupervisor, []),
      worker(StackList, [[name: StackList]])
    ]

    supervise(children, strategy: :one_for_one)
  end

  def start_stack(name) do
    {:ok, stack} = Supervisor.start_child(StackSupervisor, [])
    StackList.update(name, stack)
  end

  def push(stack, value) do
    Stack.push(find_stack(stack), value)
  end

  def pop(stack) do
    Stack.pop(find_stack(stack))
  end

  def size(stack) do
    Stack.size(find_stack(stack))
  end

  def kill(stack) do
    Stack.kill(find_stack(stack))
  end

  defp find_stack(name) do
    {:ok, stack} = StackList.find_stack(name)
    stack
  end

end
