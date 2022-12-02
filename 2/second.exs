
defmodule Adventofcode do
  
  def build_index(data) do
    list = data |> Enum.to_list
    list |> Enum.reduce( 0, fn elem, acc ->
        case String.trim(elem) do
          "A X" -> acc + 1 + 3
          "A Y" -> acc + 2 + 6
          "A Z" -> acc + 3 + 0
          "B X" -> acc + 1 + 0
          "B Y" -> acc + 2 + 3
          "B Z" -> acc + 3 + 6
          "C X" -> acc + 1 + 6
          "C Y" -> acc + 2 + 0
          "C Z" -> acc + 3 + 3
          _ -> acc
      end
    end)
  end


  def sum_of_sublist(enumerable, acc \\ 0)
  def sum_of_sublist([head | tail], acc) do
    case String.trim(head) do
      "" -> [acc | sum_of_sublist(tail)]
      x -> sum_of_sublist(tail, acc + String.to_integer(x))
    end
  end

  def sum_of_sublist([], acc) do
    [acc]
  end

  def run() do
    {:ok, data} = File.open("./second_data.txt", [ :utf8 ])
    build_index IO.stream(data, :line)
  end
end

