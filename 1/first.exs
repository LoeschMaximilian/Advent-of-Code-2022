
defmodule Adventofcode do
  
  def build_index(data) do
    list = data |> Enum.to_list
    results =[]
    sum_of_sublist(list)  |> Enum.sort(:desc) |> Enum.take(3) |> Enum.reduce(0, fn a, b -> a + b end)
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
    {:ok, data} = File.open("./first-data.txt", [ :utf8 ])
    build_index IO.stream(data, :line)
  end
end

