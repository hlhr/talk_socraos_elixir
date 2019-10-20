# elixir 2_pattern_matching.exs

# List = any type as value, stored as linked lists in memory
IO.puts("LIST")
fancy_list = [:list, "world", "42"]
IO.inspect(fancy_list)
[type_atom, _, best_number] = fancy_list
IO.inspect(type_atom)
IO.inspect(best_number)
IO.puts("")

# Tuple = any type as value, stored as one in memory
IO.puts("TUPLES")
fancy_tuple = {:tuple, "world", "666"}
IO.inspect(fancy_tuple)
{type_atom2, _, number_of_the_beast} = fancy_tuple
IO.inspect(type_atom2)
IO.inspect(number_of_the_beast)
IO.puts("")

# Map = Key-Value structure, any value as key, key is unique
defmodule AnswerChecker do
  def check(42) do
    "correct"
  end

  def check(x) when x == 41 or x == 43 do
    "so close"
  end

  def check(_) do
    "wrong"
  end
end

IO.puts("AnswerChecker")
IO.inspect(%{question: 666, answer: AnswerChecker.check(666)})
IO.inspect(%{question: 41, answer: AnswerChecker.check(41)})
IO.inspect(%{question: 43, answer: AnswerChecker.check(43)})
IO.inspect(%{question: 42, answer: AnswerChecker.check(42)})

# keyword list: checkout the guide ;)
