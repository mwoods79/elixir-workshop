defmodule StackSupervisor do
  use Supervisor

  def init(_opts) do
    children = [
      worker(Stack, [])
    ]

    supervise(children, strategy: :simple_one_for_one)
  end

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def start_child(supervisor) do
    Supervisor.start_child(supervisor, [])
  end

end

