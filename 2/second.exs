
defmodule Adventofcode do

  def run() do
    {:ok, f} = File.open("./second_data.txt", [ :utf8 ])
    data = IO.stream(f, :line)
    list = data |> Enum.to_list
    list |> Enum.reduce( 0, fn elem, acc ->
        case String.trim(elem) do
          "A X" -> acc + 3 + 0
          "A Y" -> acc + 1 + 3
          "A Z" -> acc + 2 + 6
          "B X" -> acc + 1 + 0
          "B Y" -> acc + 2 + 3
          "B Z" -> acc + 3 + 6
          "C X" -> acc + 2 + 0
          "C Y" -> acc + 3 + 3
          "C Z" -> acc + 1 + 6
          _ -> acc
      end
    end)
  end
end

