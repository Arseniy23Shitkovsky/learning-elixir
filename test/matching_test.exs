defmodule MatchingTest do
  use ExUnit.Case

  @test "test"
  @best "best"

  test "matching tuple" do
    {name, age} = {"Bob", 25}
    assert name == "Bob"

    {date, time} = :calendar.local_time()
    {year, month, day} = date

    try do
      {name, age} = "can't match"
    rescue
      MatchError -> IO.puts("error")
    end

    {@test, @best} = {"test", "best"}

    person = {:person, "Bob", 25}
    {:person, name, age} = person

    {:ok, contents} = File.read("matching.config")

    {_, time} = :calendar.local_time()
    {_date, time} = :calendar.local_time()
    {_, {hour, _, _}} = :calendar.local_time()

    expected_name = "Bob"
    {^expected_name, _} = {"Bob", 25}

    try do
      {^expected_name, _} = {"Alice", 30}
    rescue
      MatchError -> IO.puts("Error matching")
    end
  end

  test "matching lists" do
    [first, second, third] = [1, 2, 3]
    [1, second, third] = [1, 2, 3]
    [first, first, first] = [1, 1, 1]
    [first, second, _] = [1, 2, 4]
    [^first, second, _] = [1, 2, 4]

    [head | tail] = [1, 2, 3]
    assert head == 1
    assert tail == [2, 3]

    [min | _] = Enum.sort([3, 2, 1])
    assert min == 1
  end

  test "matching keywords" do
    %{name: name, age: age} = %{name: "Bob", age: 25}
    assert name == "Bob"

    # можно сопоставлять не со всем словарем
    %{age: age} = %{name: "Bob", age: 25}
  end

  test "matching binary string" do
    binary = <<1, 2, 3>>
    <<b1, b2, b3>> = binary

    # Запись rest::binary означает, что последовательность может быть произвольного размера
    <<b1, rest::binary>> = binary
    assert rest == <<2, 3>>

    #     Образец a::4 показывает, что значение переменной должно быть 4-битным.
    # В этом примере первые четыре бита бинарного представления помещаются в пе-
    # ременную a, а вторые четыре бита – в переменную b. Так как в двоичном виде
    # число 155 записывается как 10011011, значения равны 9 (1001) и 11 (1011) соот-
    # ветственно.
    <<a::4, b::4>> = <<155>>
    a == 9
    b == 11

    <<b1, b2, b3>> = "ABC"
    assert b1 == "A"

    command = "ping www.example.com"
    "ping " <> url = command
    assert url == "www.example.com"
  end

  test " difficult matching" do
    a = b = 1 + 3

    date_time = {_, {hour, _, _}} = :calendar.local_time()
    {_, {hour, _, _}} = date_time = :calendar.local_time()
  end
end
