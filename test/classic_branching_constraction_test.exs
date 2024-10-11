defmodule ClassicBranchingConstractionTest do
  use ExUnit.Case

  test "if unless" do
    # Можно записать в одну строку
    if 5 > 3, do: :one

    # Если нет блока else, а условие в if ложно, то вернется nil
    if 5 < 3, do: :one

    # Если условие в if ложно, но есть блок else, то выполнится он
    if 5 < 3, do: :one, else: :two

    if 4 > 1, do: 4 * 1, else: :wrong
  end

  def max(a, b) do
    # Можно описывать конструкцию if else многострочно
    if a >= b do
      a
    else
      b
    end
  end

  def max(a, b) do
    # макрос unless, являющийся эквивалентом конструкции if (not...)
    unless a >= b, do: b, else: a
  end
end
