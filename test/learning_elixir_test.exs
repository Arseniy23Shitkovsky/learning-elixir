defmodule LearningElixirTest do
  use ExUnit.Case
  doctest LearningElixir
  import SumServer

  setup do
    {:ok, server} = start()

    on_exit(fn ->
      stop(server)
    end)
  end

  test "greets the world" do
    assert LearningElixir.hello() == :world
  end

  test "call gen server proccess", %{server: server} do
    assert 6 == sum(server, 3, 3)
  end
end
