defmodule IterationBasedOnRecursion do
  def print(1), do: IO.puts(1)

  def print(n) when is_integer(n) and n > 0 do
    print(n - 1)
    IO.puts(n)
  end

  def sum([]), do: 0

  def sum([head | tail]) do
    head + sum(tail)
  end
end
