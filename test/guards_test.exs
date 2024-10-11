defmodule GuardsTest do
  use ExUnit.Case

  test "Guards" do
    # Выведет атом :negative
    TestNum.test(-1)
    # Выведет атом :zero
    TestNum.test(0)
    # Выведет атом :positive
    TestNum.test(-1)

    # Выведет :positive. Так случается, потому что в Elixir можно сравнивать различные типы данных.
    # И результат сравнения подчиняется следующему правилу:
    # number < atom < reference < fun < port < pid < tuple < map < list < bitstring (binary)
    TestNum.test(:not_a_number)

    # Чтобы избежать подобного сравнения в ограничитель нужно добавить проверку на тип данных к примеру:
    assert :positive == TestNum.test_with_two_limiter(1)

    # При вызове данной функции с аргументом != числу выйдет ошибка ** (FunctionClauseError)
    TestNum.test_with_two_limiter(:not_a_number)
  end

  test "Guards with lambda function" do
    test_num = fn
      x when is_number(x) and x < 0 ->
        :negative

      0 ->
        :zero

      x when is_number(x) and x > 0 ->
        :positive
    end

    #вернет :negative
    test_num.(-1)

    #вернет :zero
    test_num.(0)

    #вернет :positive
    test_num.(1)
  end
end
