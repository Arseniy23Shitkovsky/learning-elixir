defmodule LearningElixirTest do
  use ExUnit.Case
  doctest LearningElixir
  import SumServer

  test "greets the world" do
    assert LearningElixir.hello() == :world
  end

  test "call gen server proccess" do
    {:ok, server} = start()
    assert 6 == sum(server, 3, 3)
  end
end
