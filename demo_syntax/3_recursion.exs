# elixir 3_recursion.exs

defmodule Math do
  def sum(values), do: sum(values, 0)
  # def sum(values, accumulator \\ 0)

  defp sum([head | tail], accumulator) do
    sum(tail, head + accumulator)
  end

  defp sum([], accumulator) do
    accumulator
  end
end

IO.inspect(Math.sum([1, 2, 3, 4, 5, 6]))
IO.inspect(Math.sum([]))
IO.inspect(Enum.sum([1, 2, 3, 4, 5, 6]))
