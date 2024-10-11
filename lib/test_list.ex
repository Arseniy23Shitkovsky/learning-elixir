defmodule TestList do

  # ветвление с помощью функций
  def empty?([]), do: true
  def empty?([_ | _]), do: false
end
