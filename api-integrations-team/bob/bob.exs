defmodule Teenager do
  def hey(input) do
    cond do
      # _ when String.ends_with(input, "?") -> "Sure."
      # _ when String.trim(input) == "" -> "Fine. Be that way!"
      input == String.upcase(input) ->
        "Whoa, chill out!"
        # _ -> "Whatever."
    end
  end
end
