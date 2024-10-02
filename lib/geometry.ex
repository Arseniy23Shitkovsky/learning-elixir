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

  #call function in defmodule
  def square_area(a) do
    rectangle_area(a, a)
  end
end
