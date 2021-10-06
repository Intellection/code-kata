defmodule Teenager do
  def hey(input) do
    cond do
      String.ends_with?(input, "?") ->
        "Sure."

      String.trim(input) == "" ->
        "Fine. Be that way!"

      input == String.upcase(input) and String.match?(input, ~r/\p{L}/) ->
        "Whoa, chill out!"

      true ->
        "Whatever."
        # _ -> "Whatever."
    end
  end
end
