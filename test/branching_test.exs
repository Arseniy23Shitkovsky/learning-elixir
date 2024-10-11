defmodule BranchingTest do
  use ExUnit.Case

  test "Check empty list" do
    assert TestList.empty?([])
    refute TestList.empty?([1, 2])
  end

  test "Polymorphic" do
    # функция с одним и тем же названием может работать с разными типами данных,
    # благодаря ветвлению функций с несколькими предложениями
    Polymorphic.double(2)
    Polymorphic.double("test")
  end

  test "Factorial with recursive function based on branching" do
    Fact.fact(1)
  end
end
