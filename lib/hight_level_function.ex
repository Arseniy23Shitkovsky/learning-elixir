defmodule HightLevelFunction do
  def output_value_of_list(list) when is_list(list) do
    Enum.each(list, fn x -> IO.puts(x) end)
  end

  def return_new_list_with_multiplying_numbers(list) when is_list(list) do
    Enum.map(list, fn x -> 2 * x end)
  end

  def return_odd_numbers(list) when is_list(list) do
    Enum.filter(list, &(rem(&1, 2) == 1))
  end

  def return_missing_values(map) when is_map(map) do
    case Enum.filter(["login", "email", "password"], &(not Map.has_key?(map, &1))) do
      [] -> {:ok, "Map has all data"}
      ["login"] -> {:error, "Missing login"}
      ["email"] -> {:error, "Missing email"}
      ["password"] -> {:error, "Missing password"}
      ["login", "email", "password"] -> {:error, "Missing all data"}
      ["login", "email"] -> {:error, "Missing login, email"}
      ["login", "password"] -> {:error, "Missing login, password"}
      ["email", "password"] -> {:error, "Missing login, password"}
    end
  end

  def sum_elements_of_list(list) do
    Enum.reduce(list, 0, fn element, sum -> sum + element end)
  end

  def sum_elements_of_list(list, :lambda) do
    Enum.reduce(list, 0, &+/2)
  end

  def sum_elements_of_list(list, :different_types_in_list) do
    Enum.reduce(
      list,
      0,
      fn
        element, sum when is_number(element) -> sum + element
        _, sum -> sum
      end
    )
  end
end
