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

  test "test for ^" do
    #First example
    variable_1 = 1
    variable_2 = 2

    assert_raise(MatchError, "no match of right hand side value: 1", fn ->
      ^variable_2 = variable_1
    end)

    #Second example
    x = 1

    assert (case 1 do
      ^x -> true
      _ -> false
    end)

    #Third example
    a = 1

   %{"a" => ^a} = %{"a" => 1}
  end

  test "call function" do
    Geometry.in_one_line(1, 2)
    Geometry.rectangle_area 1, 2
    _x = Geometry.square_area(3)

    -5 |> abs() |> Integer.to_string() |> IO.puts()
  end

  test "call different arity function" do
    Rectangle.area(1)
    Rectangle.area(1, 2)
    x = MyModule.fun(5, 3, 3)
    IO.inspect(x)
  end

  test "private function" do
    TestPrivate.double(2)
    try do
      TestPrivate.sum(2, 2)

    rescue
      e in UndefinedFunctionError -> IO.puts("You can't call private functions")
    end

  end
end
