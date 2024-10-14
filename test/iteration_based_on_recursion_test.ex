defmodule IterationBasedOnRecursionTest do
  use ExUnit.Case

  test "natural numbers" do
    IterationBasedOnRecursion.print(10)
  end

  test "sum numbers in list" do
    assert 6 == IterationBasedOnRecursion.sum([1, 2, 3])
  end
end
