defmodule StackRestarter do

  def start_stack(name) do

    spawn(fn ->
      Process.flag(:trap_exit, true)
      {:ok, pid} = Stack.start_link
      Process.register(pid, name)

      receive do
        {:EXIT, _pid, :normal} -> # not a crash
          :ok
        {:EXIT, _pid, :shutdown} -> # not a crash
          :ok
        {:EXIT, _pid, _reason} ->
          start_stack(name)
      end
    end)

  end
end
