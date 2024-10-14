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

  test "using 'with' constraction" do
    assert {:error, "login missing"} == IfCondCaseWith.extract_user(%{})
    assert {:error, "email missing"} == IfCondCaseWith.extract_user(%{"login" => "some_login"})

    assert {:ok, %{email: "some_email", login: "some_login", password: "some_password"}} ==
             IfCondCaseWith.extract_user(%{
               "login" => "some_login",
               "email" => "some_email",
               "password" => "some_password"
             })
  end
end
