defmodule TypesTest do
  use ExUnit.Case

  test "Numbers" do
    assert 1 + 1 == 2
    assert 4 / 2 == 2.0
    assert (1 + 3) / 2 == 2.0
    assert 1_000 + 2_000 == 3_000
  end

  test "Atoms" do
    :an_atom
    :another_atom
    :"an atom with spaces"
    AnAtom == :"Elixir.AnAtom"
    :true == true
    :false == false
    true and false
    false or true
    not false
    nil == :nil
    5 == nil || false || 5 || true
    false == nil || false
    nil == false || nil
    5 == true && 5
    true == 5 || true
    false == false && 5
    nil == nil && 5
  end

  test "Tuples" do
    first_tuple = {:bob, "Hello", 33}
    33 == elem(first_tuple, 2)

    second_tuple = put_elem(first_tuple, 2, 34)
    34 == elem(second_tuple, 2)
  end

  test "Lists" do
    prime_numbers = [2, 3, 5, 7]
    4 == length(prime_numbers)
    2 == Enum.at(prime_numbers, 0)
    assert 5 in prime_numbers
    refute 4 in prime_numbers
    new_primes = List.replace_at(prime_numbers, 0, 11)
    assert [11, 3, 5, 7] == new_primes

    prime_numbers =
      prime_numbers
      |> List.replace_at(0, 11)
      |> List.insert_at(3, 13)

    assert [11, 3, 5, 13, 7, 13] == List.insert_at(prime_numbers, -1, 13)
    [1, 2, 3, 4, 5] == [1, 2, 3] ++ [4, 5]
  end
end
