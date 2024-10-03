defmodule AttributesTest do
  use ExUnit.Case

  test "Call @doc" do
    {_, _, _, _, %{"en" => "Implements basic circle functions"}, _, _} = Code.fetch_docs(Circle)
  end
end
