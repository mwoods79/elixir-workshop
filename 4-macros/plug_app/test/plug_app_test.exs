defmodule PlugAppTest do
  use ExUnit.Case
  doctest PlugApp

  test "the truth" do
    assert 1 + 1 == 2
  end
	
  test "hello method" do
    assert PlugApp.hello == :world
  end
end
