defmodule ImportAliasTest do
  import Rectangle
  use ExUnit.Case
  alias ImportAliasModule.SomeModule, as: SomeModule
  alias LearningElixir.Learn

  test "Call module via alias" do
    some_var = SomeModule.concate_string("при", "вет")
    assert some_var == "привет"
  end

  test "Call function from import module" do
     assert 4 == area(2)
  end

  test "Call function via alias without as" do
    assert :world == Learn.hello()
  end
end
