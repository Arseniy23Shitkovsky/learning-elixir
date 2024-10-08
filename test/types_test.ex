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
    true == true
    false == false
    true and false
    false or true
    not false
    nil == nil
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

    [1] == [1 | []]
    [1, 2, 3, 4] == [1 | [2, 3, 4]]
    [1 | [2 | [3 | [4 | []]]]] == [1, 2, 3, 4]

    1 == hd([1, 2, 3, 4])
    [2, 3, 4] == tl([1, 2, 3, 4])

    a_list = [5, :value, true]
    new_list = [:new_element | a_list]

    assert [:new_element, 5, :value, true] == new_list
  end

  test "Maps" do
    empty_map = %{}
    squares = %{1 => 1, 2 => 4, 3 => 9}
    assert %{1 => 1, 2 => 4, 3 => 9} == Map.new([{1, 1}, {2, 4}, {3, 9}])

    assert 4 = squares[2]
    assert nil == squares[4]

    assert 4 == Map.get(squares, 2)
    assert nil == Map.get(squares, 4)
    assert :not_found == Map.get(squares, 4, :not_found)

    assert {:ok, 4} == Map.fetch(squares, 2)
    assert :error == Map.fetch(squares, 4)

    assert 4 == Map.fetch!(squares, 2)

    try do
      Map.fetch!(squares, 4)
    rescue
      e in KeyError -> IO.puts("key 4 not found")
    end

    squares = Map.put(squares, 4, 16)
    assert 16 == squares[4]

    bob = %{:name => "Bob", :age => 25, :works_at => "Initech"}
    assert "Initech" == bob[:works_at]
    assert "Initech" == bob.works_at

    assert nil == bob[:non_existen_field]

    try do
      bob.non_existen_field
    rescue
      KeyError -> IO.puts("Key not found")
    end

    next_years_bob = %{bob | age: 26}
    assert %{age: 26, name: "Bob", works_at: "Initech"} == next_years_bob
    assert %{age: 26, name: "Bob", works_at: "Initrode"} == %{bob | age: 26, works_at: "Initrode"}
  end

  test "Strings" do
    assert ~s(hello people, everybody) == "hello people, everybody"
    assert ~S(Not interpolated #{3 + 0.14}) == "Not interpolated \#{3 + 0.14}"

    """
    Heredoc must end on its own line \"""
    """

    assert "String" <> " " <> "concatenation" == "String concatenation"

    'Interpolation: #{3 + 0.14}' == 'Interpolation: 3.14'
    ~c(Character list sigil) == 'Character list sigil'
    ~C(Unescaped sigil #{3 + 0.14}) == 'Unescaped sigil \#{3 + 0.14}'

    '''
    heredoc
    '''

    'ABC' == String.to_charlist("ABC")
    "ABC" == List.to_string('ABC')
  end

  test "Functions" do
    square = fn x -> x * x end
    25 == square.(5)

    print_element = fn x -> IO.puts(x) end
    Enum.each([1, 2, 3], print_element)

    Enum.each([1, 2, 3], &IO.puts/1)

    lambda = fn x, y, z -> x * y + z end
    lambda = &(&1 * &2 + &3)
    10 == lambda.(2, 3, 4)

    outside_var = 5

    lambda = fn -> IO.puts(outside_var) end
    outside_var = 6

    5 == lambda.()
  end

  test "Range" do
    range = 1..2
    true == 2 in range
    false == -1 in range

    Enum.each(1..3, &IO.puts/1)
  end

  test "Keywords" do
    days = [{:monday, 1}, {:tuesday, 2}, {:wednesday, 3}]
    days = [monday: 1, tuesday: 2, wednesday: 3]
    1 == Keyword.get(days, :monday)
    nil == Keyword.get(days, :noday)
    2 == days[:tuesday]

    IO.inspect([100, 200, 300], [width: 3])
    IO.inspect([100, 200, 300], width: 3, limit: 1)

  end

  test "MapSets" do
    days = MapSet.new([:monday, :tuesday, :wednesday])
    assert MapSet.member?(days, :monday)
    refute MapSet.member?(days, :noday)

    days = MapSet.put(days, :thursday)
    Enum.each(days, &IO.puts/1)
  end
end
