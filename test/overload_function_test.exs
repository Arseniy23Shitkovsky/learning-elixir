defmodule OverloadFunctionTest do
  use ExUnit.Case

  test "overload function test" do
    assert 20 == Geometry.area({:rectangle, 4, 5})
    assert 25 == Geometry.area({:square, 5})
    assert 50.24 == Geometry.area({:circle, 4})

    fun = &Geometry.area/1
    assert 50.24 == fun.({:circle, 4})
    assert 25 == fun.({:square, 5})
    assert 20 == fun.({:rectangle, 4, 5})

    assert {:error, {:unknown_shape, {:triangle, 1, 2, 3}}} == Geometry.area({:triangle, 1, 2, 3})
  end
end
