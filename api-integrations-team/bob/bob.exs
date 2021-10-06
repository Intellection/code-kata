defmodule Teenager do
  def hey(input) do
    case input do
      _ when String.ends_with("?") -> "Sure."
      _ when String.trim(input) == "" -> "Fine. Be that way!"
      String.upcase(input) -> "Whoa, chill out!"
      _ -> "Whatever."
    end
  end
end
