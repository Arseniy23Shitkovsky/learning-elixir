defmodule HightLevelFunctionTest do
  use ExUnit.Case

  test "call Enum.each" do
    HightLevelFunction.output_value_of_list([1, 2, 3])
  end

  test "call Enum.map" do
    HightLevelFunction.return_new_list_with_multiplying_numbers([2, 3, 4])
  end

  test "call Enum.filter" do
    {:ok, "Map has all data"} = HightLevelFunction.return_missing_values(%{
      "login" => "some_login",
      "email" => "some_email",
      "password" => "some_password"
    })

    {:error, "Missing login, password"} = HightLevelFunction.return_missing_values(%{
      "login" => "some_login"
    })
  end

  test "call Enum.reduce" do
  IO.puts(HightLevelFunction.sum_elements_of_list([1, 2, 3]))
  IO.puts(HightLevelFunction.sum_elements_of_list([4, 5, 6], :lambda))
  IO.puts(HightLevelFunction.sum_elements_of_list([1, "not a number", 2, :x, 3], :different_types_in_list))
  end
end
