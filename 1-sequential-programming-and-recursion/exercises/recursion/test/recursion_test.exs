defmodule RecursionTest do
  use ExUnit.Case
  test "the math" do
    assert 1 + 1 == 2
  end
  test "or truth vs thing" do
    assert true == Recursion.b_or(true, "thing")
  end
  test "or true" do
    assert true == Recursion.b_or(true, false)
  end
  test "or truth when both true" do
    assert true == Recursion.b_or(true, true)
  end
  test "true expected from true or false" do
    assert true == Recursion.b_or(false, true)
  end
  test "and truth" do
    assert true == Recursion.b_and(true,true)
  end
  test "the and false" do
    assert false == Recursion.b_and(false, false)
  end
  test "the print nothing" do
    assert "end of list" == Recursion.print_all([])
  end
  test "the print all" do
    assert "end of list" == Recursion.print_all([1,3,4,5,6,6])
  end

  test "the count nothing" do
    assert 0 == Recursion.count([])
  end
  test "the count all" do
    assert 4 == Recursion.count([2,3,4,5])
  end

  test "the big test" do
    listy = [2,3,3,3,2,5,3,3]
    Recursion.print_all(listy)
    assert 8 == Recursion.count(listy)
    assert Recursion.remove_dups(listy)
    assert "end of list" == Recursion.print_all(listy)

    assert [2,3,2,5,3] == Recursion.remove_dups(listy)
    assert [2,2,3,3,3,3,3,5] == Recursion.quicksort(listy)
    end
end
