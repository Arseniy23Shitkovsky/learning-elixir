defmodule TestNum do
  # Чтобы указать ограничитель, добавьте предложение when после списка аргументов.
  def test(x) when x < 0 do
    :negative
  end

  def test(0), do: :zero

  def test(x) when x > 0 do
    :positive
  end

  def test_with_two_limiter(x) when is_number(x) and x > 0 do
    :positive
  end
end
