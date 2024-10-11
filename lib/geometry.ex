defmodule Geometry do
  def rectangle_area(a, b) do
    a * b
  end

  # without (parameters)
  def run do
    2 * 4
  end

  # in one line
  def in_one_line(a, b), do: a * b

  # call function in defmodule
  def square_area(a) do
    rectangle_area(a, a)
  end

  # Перегрузка функций
  def area({:rectangle, a, b}) do
    a * b
  end

  def area({:square, a}) do
    a * a
  end

  def area({:circle, r}) do
    r * r * 3.14
  end

  # Среда выполнения всегда проходит предложения в том по-
  # рядке, в котором они заданы в исходном коде. Если предложение area(unknown) будет
  # стоять первым, вы всегда будете получать ошибку.
  def area(unknown) do
    {:error, {:unknown_shape, unknown}}
  end
end
