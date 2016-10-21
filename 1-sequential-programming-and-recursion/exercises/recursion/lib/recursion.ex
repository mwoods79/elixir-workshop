defmodule Recursion do

  def b_not(true), do: false
  def b_not(false), do: true

  def b_or(true, _named_thing), do: true
  def b_or(_true, true), do: true
  def b_or(_false, _false), do: false

  def b_and(true, true), do: true
  def b_and(_false, _false), do: false

  def print_all([]) do
    IO.inspect("end of list")
  end

  def print_all([first_item|rest_of_the_list]) do
    IO.inspect(first_item)
    print_all(rest_of_the_list)
  end

  def count([]), do: 0
  def count([h|t]), do: 1 + count(t)

  def remove_dups(list) when is_list(list) do
    remove_dups(list, [])
  end

  def remove_dups([h|t1], [h|t2] = acc) do
    remove_dups(t1, acc)
  end

  def remove_dups([h|t], acc) do
    remove_dups(t, [h|acc])
  end

  def remove_dups([], acc) do
    # :lists:reverse(acc)
    Enum.reverse(acc)
  end

  def quicksort([]), do: []

  def quicksort([pivot|rest]) do
    lesser = Enum.filter(rest, fn i -> i <= pivot end)
    # lesser = for i <- rest when i <= pivot, do: i
    greater = Enum.filter(rest, fn i -> i > pivot end)
    # greater = for i <- rest when i > pivot, do: i
    quicksort(lesser) ++ [pivot] ++ quicksort(greater)
  end
end
